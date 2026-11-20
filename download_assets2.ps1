$ErrorActionPreference = 'Stop'
$siteDir = "C:\Users\user\Desktop\Web cartoon\Web-cartoon\site# Ensure subfolders
New-Item -ItemType Directory -Path $siteDir -Force | Out-Null
# URLs to download
$resources = @(
    @{ Url = "https://itomdev.com/assets/index-7YSu33UF.css"; Out = "index-7YSu33UF.css" },
    @{ Url = "https://itomdev.com/assets/index-BWgbYKJh.js"; Out = "index-BWgbYKJh.js" },
    @{ Url = "https://itomdev.com/textures/paper-texture.webp"; Out = "textures\paper-texture.webp" },
    @{ Url = "https://itomdev.com/favico.png"; Out = "favico.png" },
    @{ Url = "https://itomdev.com/og-image.webp"; Out = "og-image.webp" },
    @{ Url = "https://fonts.googleapis.com/css2?family=Caveat:wght@400;500;600;700&family=Gloria+Hallelujah&family=Inter:wght@300;400;500;600;700&display=swap"; Out = "fonts.css" }
)
foreach ($r in $resources) {
    $destPath = Join-Path $siteDir $r.Out
    $destDir = Split-Path $destPath -Parent
    if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }
    Write-Host "Downloading $($r.Url) -> $destPath    Invoke-WebRequest -Uri $r.Url -OutFile $destPath -UseBasicParsing
}
# Create simple Arabic README
$readme = @# نسخة ثابتة من موقع ITom

هذا المستودع يحتوي على نسخة محلية ثابتة (static) من الموقع [https://itomdev.com](https://itomdev.com).

## ما يشمل المجلد `site`
- `index.html` – ملف HTML الأساسي.
- `index-7YSu33UF.css` – ملفات CSS.
- `index-BWgbYKJh.js` – ملف JavaScript.
- `favico.png` – أيقونة الموقع.
- `og-image.webp` – صورة Open Graph.
- `textures/paper-texture.webp` – صورة الخلفية المستخدمة.
- `fonts.css` – استدعاء خطوط Google (تُحمل من CDN عند تشغيل الصفحة).

## تشغيل الموقع محليًا
```powershell
cd site
# يمكنك استخدام أي خادم ثابت، مثال:
npx serve .   # إذا كان Node.js مثبتًا
```
أو افتح `index.html` مباشرةً في المتصفح.

---
*تم إنشاؤه تلقائيًا بواسطة Antigravity.*
"@
Set-Content -Path "C:\Users\user\Desktop\Web cartoon\Web-cartoon\README.md" -Value $readme -Encoding UTF8
"