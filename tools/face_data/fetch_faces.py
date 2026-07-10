import urllib.request, ssl, os, sys, numpy as np
ctx=ssl.create_default_context(); ctx.check_hostname=False; ctx.verify_mode=ssl.CERT_NONE
mirrors=[
 ("olivetti-figshare","https://ndownloader.figshare.com/files/5976027","mat"),
 ("orl-github","https://github.com/robaita/introduction_to_machine_learning/raw/main/att_faces.zip","zip"),
 ("olivetti-sklearn","https://storage.googleapis.com/scikit-learn-data/olivetti.mat","mat"),
 ("lfw-sklearn","https://ndownloader.figshare.com/files/5976015","tgz"),
]
os.makedirs("tools/face_data", exist_ok=True)
for name,url,kind in mirrors:
    try:
        print(f"try {name} {url}", flush=True)
        req=urllib.request.Request(url, headers={'User-Agent':'Mozilla/5.0'})
        data=urllib.request.urlopen(req, timeout=45, context=ctx).read()
        dst=f"tools/face_data/raw_{name}.{kind}"
        open(dst,'wb').write(data)
        print(f"OK {name}: {len(data)} bytes -> {dst}", flush=True)
        break
    except Exception as e:
        print(f"FAIL {name}: {type(e).__name__} {str(e)[:80]}", flush=True)
