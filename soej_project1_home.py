import streamlit as st
from PIL import Image


def run_home() :
    # st.subheader('홈 화면입니다.')
    
    st.text('함께 운동해요!!')

    img = Image.open('data2/daeil_bjj.jpg')
    st.image(img)