import streamlit as st
from soej_project1_home import run_home

def main() :
  
    st.title('인천지역 체육관 찾기 어플')

    menu = ['Home', 'About','지역별 검색','종목별 검색','시합일정','EDA','ML']
    choice = st.sidebar.selectbox('메뉴',menu)
    
    if choice == menu[0]:
        run_home()
    elif choice == menu[1]:
       pass
    elif choice == menu[2]:
       pass
    elif choice == menu[3]:
        pass

if __name__ == "__main__" :
    main()