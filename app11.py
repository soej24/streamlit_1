import streamlit as st
import pandas as pd

def main() :
    # 스트림릿에서 제공해주는 차트
    # line_chart, area_chart

    df1 = pd.read_csv('data2/lang_data.csv')
    st.dataframe(df1)

    lang_list = df1.columns[ 1 : ] # 컬럼이름을 가져오는데 week는 빼고 끝까지 다 가져온다.
    
    choice_list = st.multiselect('언어를 선택해 주세요', lang_list) # 내가 선택한 프로그래밍 값을 변수에 저장한다.

    if len(choice_list) != 0 :
        df_choice = df1[choice_list] # 화면에 보여주기 위해 먼저 변수에 저장
        st.dataframe(df_choice)

        # 스트림릿이 제공하는 line_chart
        st.line_chart(df_choice)  # 스트림릿이 제공하는 차트기 때문에 변수만 가져오면 된다.

        # 스트림릿이 제공하는 area_chart
        st.area_chart(df_choice)


if __name__ == '__main__' :
    main()