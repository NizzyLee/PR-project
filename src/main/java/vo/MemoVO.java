package vo;

import org.springframework.web.multipart.MultipartFile;

public class MemoVO {
	private int idx,star;
	private String  title, filename ,titleimg ;
	private MultipartFile photo ,photo2; //파일을 업로드하는 클래스
	public int getStar() {
		return star;
	}
	public MultipartFile getPhoto2() {
		return photo2;
	}
	public void setPhoto2(MultipartFile photo2) {
		this.photo2 = photo2;
	}
	public void setStar(int star) {
		this.star = star;
	}

	public String getTitleimg() {
		return titleimg;
	}
	public void setTitleimg(String titleimg) {
		this.titleimg = titleimg;
	}

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	
}
