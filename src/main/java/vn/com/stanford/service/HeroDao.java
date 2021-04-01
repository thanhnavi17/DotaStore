package vn.com.stanford.service;

import java.util.List;

import vn.com.stanford.entity.Hero;

public interface HeroDao extends HanhDong<Hero, Integer>{
	List<Hero> timKiemTheoStat(int statID);
}
