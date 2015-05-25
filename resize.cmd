@echo off
:: Uses ImageMagick for image resize and convertion
:: Formats: JPEG, WebP, JPEG2000
:: - exluded JPEG XR format because of no support in ImageMagick (and server tools propably also)
:: - DO NOT enlarge images, provide smaller version instead

call :convert sample1.jpg
call :convert sample2.jpg
call :convert sample3.jpg
call :convert sample4.jpg
call :convert sample5.jpg
call :convert sample6.jpg
call :convert sample7.jpg
call :convert sample8.jpg
call :convert sample9.jpg
call :convert sample10.jpg

goto :eof


:convert
	setlocal

	set original=%1
	echo Converting %original%

	:: 4096
	echo 4096
	convert -strip -resize "4096>" -interlace Plane -sampling-factor 4:2:0 -define jpeg:dct-method=float -quality 50 -sharpen 0x1 %original% _%original%_4096.jpg
	convert -strip -resize "4096>" -interlace Plane -quality 50 -sharpen 0x1 %original% _%original%_4096.webp
	convert -strip -resize "4096>" -quality 35 -sharpen 0x1 %original% _%original%_4096.jp2

	:: 2048
	echo 2048
	convert -strip -resize "2048>" -interlace Plane -sampling-factor 4:2:0 -define jpeg:dct-method=float -quality 60 -sharpen 0x1 %original% _%original%_2048.jpg
	convert -strip -resize "2048>" -interlace Plane -quality 60 -sharpen 0x1 %original% _%original%_2048.webp
	convert -strip -resize "2048>" -quality 37 -sharpen 0x1 %original% _%original%_2048.jp2

	:: 1200
	echo 1200
	convert -strip -resize "1200>" -interlace Plane -sampling-factor 4:2:0 -define jpeg:dct-method=float -quality 80 -sharpen 0x1 %original% _%original%_1200.jpg
	convert -strip -resize "1200>" -interlace Plane -quality 80 -sharpen 0x1 %original% _%original%_1200.webp
	convert -strip -resize "1200>" -quality 38 -sharpen 0x1 %original% _%original%_1200.jp2

	:: 992
	echo 992
	convert -strip -resize "992>" -interlace Plane -sampling-factor 4:2:0 -define jpeg:dct-method=float -quality 80 -sharpen 0x1 %original% _%original%_992.jpg
	convert -strip -resize "992>" -interlace Plane -quality 80 -sharpen 0x1 %original% _%original%_992.webp
	convert -strip -resize "992>" -quality 38 -sharpen 0x1 %original% _%original%_992.jp2

	:: 768
	echo 768
	convert -strip -resize "768>" -interlace Plane -sampling-factor 4:2:0 -define jpeg:dct-method=float -quality 80 -sharpen 0x1 %original% _%original%_768.jpg
	convert -strip -resize "768>" -interlace Plane -quality 80 -sharpen 0x1 %original% _%original%_768.webp
	convert -strip -resize "768>" -quality 37 -sharpen 0x1 %original% _%original%_768.jp2

	:: 480
	echo 480
	convert -strip -resize "480>" -interlace Plane -sampling-factor 4:2:0 -define jpeg:dct-method=float -quality 80 -sharpen 0x1 %original% _%original%_480.jpg
	convert -strip -resize "480>" -interlace Plane -quality 80 -sharpen 0x1 %original% _%original%_480.webp
	convert -strip -resize "480>" -quality 36 -sharpen 0x1 %original% _%original%_480.jp2

	:: 320
	echo 320
	convert -strip -resize "320>" -interlace Plane -sampling-factor 4:2:0 -define jpeg:dct-method=float -quality 70 %original% _%original%_320.jpg
	convert -strip -resize "320>" -interlace Plane -quality 70 %original% _%original%_320.webp
	convert -strip -resize "320>" -quality 35 %original% _%original%_320.jp2

	endlocal
