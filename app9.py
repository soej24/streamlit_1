# 파일을 분리해서 만드는 방법
# 코드의 복잡도를 줄이기 위해 분리한다.

import streamlit as st

from app9_home import run_home  # 런홈 함수를 작성한 뒤 임포트해서 적용시킨다.
from app9_eda import run_eda
from app9_ml import run_ml
from app9_about import run_about

def main():
    st.title('파일 분리 앱')

    menu = ['Home', 'EDA','ML','About']
    choice = st.sidebar.selectbox('메뉴',menu)
    
    if choice == menu[0]:  # 여기 들어갈 내용을 다른 파일로 만든다.
        run_home()
    elif choice == menu[1]:
        run_eda()
    elif choice == menu[2]:
        run_ml() 
    elif choice == menu[3]:
        run_about() 


if __name__ == '__main__':
    main()