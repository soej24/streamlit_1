import streamlit as st
from app9_eda import run_eda
from soej_project1_about import run_about
from soej_project1_byitem import run_byitem
from soej_project1_home import run_home
from soej_project1_ml import run_ml
from soej_project1_regional import run_regional
from soej_project1_schedule import run_schedule

def main() :
  
    st.title('인천지역 체육관 찾기 어플')

    menu = ['Home', 'About','지역별 검색','종목별 검색','시합일정','EDA','ML']
    choice = st.sidebar.selectbox('메뉴',menu)
    
    if choice == menu[0]:
        run_home()
    elif choice == menu[1]:
        run_about()
    elif choice == menu[2]:
        run_regional()
    elif choice == menu[3]:
        run_byitem()
    elif choice == menu[4]:
        run_schedule()
    elif choice == menu[5]:
        run_eda()
    elif choice == menu[6]:
        run_ml()

if __name__ == "__main__" :
    main()