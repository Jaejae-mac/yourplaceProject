let category = [
				[ "가정집", "전체", "아파트", "주택", "빌라", "원룸", "한옥", "홈오피스" ],
				[ "스튜디오", "전체", "자연광", "호리존", "유튜브", "원룸", "단독주택형", "빈티지",
						"키친", "무대형", "세트장", "기타공간" ],
				[ "상업공간", "전체", "카페", "식당", "바/술집", "원룸", "헬스장", "요가/필라테스" ],
				[ "편의시설", "전체", "편의점", "빨래방", "헤어방", "PC방", "노래방", "오락실" ],
				[ "문화공간", "전체", "복합문화공간", "갤러리", "공방/작업실", "책방", "공연장", "강당",
						"강의실" ],
				[ "특수공간", "전체", "사무실", "병원/약국", "학교", "학원", "클럽", "웨딩", "호텔펜션",
						"기타 특수 공간" ],
				[ "대형공간/야외", "전체", "공장", "창고", "지하실", "빈 공간", "옥상", "정원",
						"캠핑장", "기타 야외 공간" ], ];

function click_category(id1, id2) {
			console.log(category[id1][0] + " , " + category[id1][id2]);
			//location.href = "/category.do?maincate=" + category[id1][0]
				//	+ "&subcate=" + category[id1][id2];
		}