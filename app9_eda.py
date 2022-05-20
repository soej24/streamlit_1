from sqlalchemy import null
import streamlit as st
import pandas as pd
import numpy as np
def run_eda() :
    st.subheader('EDA 화면')

    df = pd.read_csv('data2/iris.csv')

    # 컬럼이름을 보여주시고,
    # 여러 컬럼들 선택 가능토록 하여,
    # 선택한 컬럼들만 화면에 보여줍니다.
    column_list = df.columns
    choice_list = st.multiselect('컬럼을 선택하세요', column_list)
    if len(choice_list) != 0 :
        st.dataframe(df[choice_list])
        # 상관계수를 구하여 화면에 보여줍니다.
        st.write(df[choice_list].corr())
    