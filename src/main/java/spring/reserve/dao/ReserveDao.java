package spring.reserve.dao;

import java.util.List;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
import spring.dto.ReserveDto;

@Repository
public class ReserveDao extends SqlSessionDaoSupport implements ReserveDaoInter {

	@Override
	public String getTotalCount(String rmnum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("totalCountOfReserve", rmnum);
	}

	@Override
	public void insertReserve(ReserveDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().insert("insertOfReserve", dto);
	}

	@Override
	public ReserveDto getData(String rnum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("selectOneOfReserve", rnum);
	}

	@Override
	public List<ReserveDto> getAllDatas() {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("selectAllOfReserve");
	}

	@Override
	public void updateReserve(ReserveDto dto) {
		// TODO Auto-generated method stub
		getSqlSession().update("updateOfReserve", dto);
	}

	@Override
	public void deleteReserve(String rnum) {
		// TODO Auto-generated method stub
		getSqlSession().delete("deleteOfReserve", rnum);
	}
	
	@Override
	public List<ReserveDto> getDataRm(String rmnum) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("selectRmOfReserve", rmnum);
	}
}
