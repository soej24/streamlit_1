import streamlit as st

def main() :
    
    # 비밀번호 입력
    password = st.text_input('비밀번호 입력', type='password')
    st.write(password)

if __name__ == "__main__" :
    main()