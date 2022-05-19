import streamlit as st

def main() :
    st.title('웹 대시보드')
    st.text('웹 대시보드 개발하기')

    name = '홍길동'

    # 제 이름은 홍길동 입니다.
    print('제 이름은 {} 입니다'.format(name))  # print는 비쥬얼 스튜디오 여기에 찍힘

    st.text('제 이름은 {} 입니다.'.format(name)) # 작은 글씨

    st.header('이 영역은 헤더 영역')  # 제목같은 큰 글씨

    st.subheader('이 영역은 subheader영역')  
    st.success('작업이 성공했을때 사용하자')         # 녹색 영역
    st.warning('경고 문구를 보여주고 싶을때 사용하자')   # 노란색 영역
    st.info('정보를 보여주고 싶을때 사용하자')  # 파란색 영역
    st.error('문제가 발생했을때 사용')  # 레드 영역

    # 파이썬의 함수 사용법을 보여주고 싶을때
    st.help(sum)  # 함수 설명을 보여주고 싶을때 (sum)
    st.help(len)


if __name__ == '__main__' :
    main()