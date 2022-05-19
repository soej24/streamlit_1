import streamlit as st
import pandas as pd

# 이미지 처리를 위한 라이브러리
from PIL import Image

def main() :
    # 1. 저장되어 있는 이미지 파일을 화면에 표시하기
    img = Image.open('data2/image_03.jpg')

    st.image(img)

    # 가로 영역을 꽉 채우도록
    st.image(img, use_column_width=True)

    # 2. 인터넷상에 있는 이미지를 화면에 표시하기
    # URL이 있는 이미지를 말한다.
    url = 'https://mblogthumb-phinf.pstatic.net/MjAxOTA1MzBfMTQ2/MDAxNTU5MTQ1ODE2NjA3.6La-NOgjz1b0y4JCSa-aXz8VxXVp7XaXMH8bKYp3fGUg.IXVzYgdt7xpTypLR7LY9nLtbgJ388QHfGdMw_TlPm4kg.JPEG.ads12300/IMG_1089.JPG?type=w800'

    st.image(url)

    # 비디오 동영상 화면에 표시하기
    video_file = open('data2/secret_of_success.mp4', 'rb')
    st.video(video_file)

    # 오디오 화면에 표시하기
    audio_file = open('data2/song.mp3', 'rb')
    st.audio( audio_file.read() , format='audio/mp3')
    
if __name__ == '__main__' :
    main()