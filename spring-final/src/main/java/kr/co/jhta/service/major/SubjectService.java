package kr.co.jhta.service.major;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.vo.Subject;
import kr.co.jhta.vo.SubjectEditForm;
import kr.co.jhta.vo.SubjectIsPassed;
import kr.co.jhta.vo.SubjectSearchForm;

@Transactional
public interface SubjectService {

	void addSubject(Subject subject);
	List<Subject> getAllList();
	List<Subject> getByProIdList(String id);
	List<SubjectIsPassed> getPassAllList();
	List<Subject> getSubjectByOpt(SubjectSearchForm searchform);
	void addSubject2(Subject subject);
	void deleteSub(int no);
	Subject getByNoList(int no);
	void subupdate(Subject subject);
	Subject getSubByNo(int sno);
	
	String getPassCodeByNo(int sno);
	void editSubjectByNo (SubjectEditForm editform);
	List<Subject> getallenroll();
	Subject getByENoList(int no);
	Subject getsubByEnrollNoService(int eno);
}
