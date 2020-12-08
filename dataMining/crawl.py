import requests
import urllib.request
from pyquery import PyQuery as pq
import json
import os
import time
import random
import re
import pickle


def save_img(dir_path, img_path, img_raw):
    if not os.path.exists(dir_path):
        os.mkdir(dir_path)
    save_path = img_path  
    imgfile = open(save_path, "wb")
    imgfile.write(img_raw)
    imgfile.close()
    print("photo saved.")



def parse_model_and_img_from_single_cloth_page(url, brand="", category=""):
    s3 = s.get(url)
    s3 = s.get(url, cookies=s2.cookies)

    doc = pq(s3.text)

    product_title = doc('div').filter(lambda i: pq(this).attr('itemprop') == 'name').text()
    
    
    # Note: model info is not all the time there    
    model_info = doc('.purchase-attributes__model-info').text()
    if len(model_info):
        words = model_info.split(" ")
        model_name = words[0]
        model_height = re.search(r"\d+[’\"\']\d+", words[2]).group(0)        
        model_size = words[-1]

    # Primary color
    image_pool = doc('picture.pictureContainer-36lBu source').items()
    image_links = []

    # Retrieve image: each clothes can have multiple shots    
    for i, pic in enumerate(image_pool):
        link = pic.attr('srcset')
        if link != None:
            link = link.split('?wid=')[0]
            image_links.append(link)
        
    image_links = set(image_links)
    
    # Only save image if the model can be identified
    has_model_name = True
    try:
        if model_name:
            has_model_name = True
    except:
        has_model_name = False


    if not has_model_name:
        model_name = "anonymous"

    if not os.path.exists(model_name):
        os.mkdir(model_name)

    # Save image to foolders    
    count = 0
    product_title_clean = ''.join(e for e in product_title if e.isalnum())
    
    if has_model_name:
        dir_path = os.path.join(model_name, product_title_clean)
    else:
        # Set anonymous idex for anonymous models, because many anonymous models could wear the same product, so anonymous+productName combination would not differentiate
        anonymous_idx_file = os.path.join(model_name, "anonymousIdx.p")
        if not os.path.exists(anonymous_idx_file):
            pickle.dump(0, open(anonymous_idx_file, "wb"))
        anonymous_idx = pickle.load(open(anonymous_idx_file,"rb"))
        pickle.dump(anonymous_idx+1, open( anonymous_idx_file, "wb"))
        dir_path = os.path.join(model_name, str(anonymous_idx) + '_' + product_title_clean)

    if not os.path.exists(dir_path):
        os.mkdir(dir_path)

    
    for link in image_links:
        response = requests.get(link)
        if response:
            save_path = os.path.join(dir_path, (model_name + '_' + product_title_clean + '_' + str(count) + ".jpeg"))  
            # save_img(dir_path, save_path, response.content)            
            count += 1
        else:
            print("The img link does not have response:", link)

    # Save product summary
    page_summary = {}

    image_links = list(image_links)
    image_links.sort(key=lambda x: int(x.split("_")[-1]))

    if has_model_name:

        with open(os.path.join(dir_path, "product.json"), 'w') as f:
            page_summary["model"] = model_name
            page_summary["model_height"] = model_height
            page_summary["model_wear_size"] = model_size
            page_summary["product_title"] = product_title
            page_summary["brand"] = brand
            page_summary["category"] = category
            page_summary["img_urls"] = image_links
            json.dump(page_summary, f)
    else:
        with open(os.path.join(dir_path, "product.json"), 'w') as f:
            page_summary["product_title"] = product_title
            page_summary["brand"] = brand
            page_summary["category"] = category
            page_summary["img_urls"] = image_links
            json.dump(page_summary, f)

    print(product_title)
    print("model", model_name)

    return doc, page_summary



user_records = {}
# category_urls = ['https://shop.lululemon.com/api/c/tops-long-sleeve/', 
#                  "https://shop.lululemon.com/api/c/womens-leggings/"
#                  "https://shop.lululemon.com/api/c/tops-short-sleeve/,
#                  "https://shop.lululemon.com/api/c/women-tanks/",
#                  "https://shop.lululemon.com/api/c/mens-ls-tops/"
#                  "https://shop.lululemon.com/api/c/mens-ss-tops/",
#                  "https://shop.lululemon.com/api/c/mens-t-shirts/",
#                  "https://shop.lululemon.com/api/c/mens-jackets-and-hoodies-hoodies/"]
category_urls = ["https://shop.lululemon.com/api/c/mens-jackets-and-hoodies-hoodies/"]

s = requests.session()
s.max_redirects = 100



for cat_url in category_urls:
    crawl_page = 0
    main_page_url = cat_url

    has_next_page = True
    # To parse more data from it, we need to read in JSON via JASON
    while has_next_page:


        crawl_page += 1
        print("Start to crawl page:", crawl_page)
        print(main_page_url)

        # polite crawler
        second = random.randint(2,10)
        time.sleep(second)
        
        s2 = s.get(main_page_url)
        s2 = s.get(main_page_url, cookies=s2.cookies)
        json_doc = json.loads(s2.text)

        # Update the information for the next loop in pages
        current_page = json_doc['links']['self']
        next_page = json_doc['links']['next']
        last_page = json_doc['links']['last']
        main_page_url = "https://shop.lululemon.com/api/" + next_page
        

        if current_page == last_page:
            has_next_page = False

        list_of_clothes = json_doc['data']['attributes']['main-content'][0]['records']

        for idx, item in enumerate(list_of_clothes):
            product_url = 'https://shop.lululemon.com' + item['pdp-url']
            category = item['parent-category-unified-id']
            
            print(idx, ":", product_url)
            

            for attempt in range(3):
                try:
                    doc, page_summary = parse_model_and_img_from_single_cloth_page(product_url, brand="lululemon", category=category)
                except:
                    print("parsing fail. Retry")
                    time.sleep(30)
                else:
                    # success, break the attempt loop
                    break
            else:
                continue


            # Parse the product in other color swaps        
            color_codes = []

            colors_swap = doc('div').filter(lambda i: pq(this).attr('role') == 'radio').items()
            for c in colors_swap:
                color_imgs = c.find('source').filter(lambda i: pq(this).attr('sizes') == '34px').items()
                for swap in color_imgs:
                    link = swap.attr('srcset')

                    if link != None:
                        link = link.split('?wid=')[0]
                        color_code = link.split('/')[-1]
                        if color_code not in color_codes:
                            color_codes.append(color_code)

            color_codes = color_codes[1:] # main color is already processed.
            new_color_urls = [(product_url + '?color=' + i) for i in color_codes]

            for i, url in enumerate(new_color_urls):
                try:
                    print("color variety", i)
                    new_color_doc, page_summary = parse_model_and_img_from_single_cloth_page(url, brand="lululemon", category=category)
                except:
                    print("parsing failed")
                    continue
        #         user_records = update_user_dictionary(page_summary, user_records)


        print("finish crawling", crawl_page, "pages.")

