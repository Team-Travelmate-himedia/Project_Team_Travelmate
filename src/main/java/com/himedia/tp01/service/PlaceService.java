package com.himedia.tp01.service;

import com.himedia.tp01.dao.IPlaceDao;
import com.himedia.tp01.dto.Paging;
import com.himedia.tp01.dto.PlaceVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class PlaceService {

    @Autowired
    IPlaceDao pdao;

    /* request 에 맞는 placeList 정보 가져오기 */
    public HashMap<String, Object> selectPlaceList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        HashMap<String, Object> result = new HashMap<>();
        int count = 0; // 총 페이지 수 담을 count
        List<PlaceVO> placeList = null; // 장소 목록 담을 list

        // 'first' 파라미터가 ture 일 경우 page, key 세션 초기화 및 placeCategory 세션 저장
        if (Boolean.parseBoolean(request.getParameter("first"))) {
            session.removeAttribute("page");
            session.removeAttribute("key");
            session.setAttribute("placeCategory", request.getParameter("placeCategory"));
        }

        // 페이지 번호 처리
        int page = Integer.parseInt(request.getParameter("page"));
        /*if((session.getAttribute("page") != null) && page != 1){
            page = (Integer)session.getAttribute("page"); // 세션에서 page 값 가져오기
        }
        session.setAttribute("page", page);*/

        // 페이징 처리
        Paging paging = new Paging();
        paging.setPage(page);
        paging.setDisplayPage(6);
        paging.setDisplayRow(6);

        // 검색 키워드 처리
        String key = request.getParameter("key");
        if ("".equals(key) && session.getAttribute("key") != null) {
            key = (String)session.getAttribute("key"); // 세션에서 key 값 가져오기
        }
        session.setAttribute("key", key);

        // 카테고리 처리
        String placeCategory = request.getParameter("placeCategory");
        if (session.getAttribute("placeCategory") != null) {
            placeCategory = (String)session.getAttribute("placeCategory"); // 세션에서 placeCategory 값 가져오기
        }

        // 카테고리에 따른 데이터 처리
        if ("best".equals(placeCategory)) { // placeCategory 가 best 이라면
            count = pdao.getBestCount("place", "place_name", key);
            paging.setTotalCount(count);
            paging.calPaging();
            placeList = pdao.getBestPlace(paging, key); // BEST 장소 목록 가져오기
        } else if ("hot".equals(placeCategory)) { // placeCategory 가 hot 이라면
            count = pdao.getHotCount("place", "place_name", key);
            paging.setTotalCount(count);
            paging.calPaging();
            placeList = pdao.getHotPlace(paging, key); // HOT 장소 목록 가져오기
        } else { // placeCategory.equals("all") placeCategory 가 all 이라면
            count = pdao.getAllCount("place", "place_name", key);
            paging.setTotalCount(count);
            paging.calPaging();
            placeList = pdao.getAllPlaceList(paging, key); // 모든 장소 목록 가져오기
        }
        result.put("placeList", placeList);
        result.put("paging", paging);
        result.put("key", key);
        result.put("placeCategory", placeCategory);
        return result;
    }

    /* place_seq 에 해당하는 place 상세 정보 가져오기 */
    public PlaceVO getPlace(int place_seq) {
        return pdao.getPlace(place_seq);
    }

}
