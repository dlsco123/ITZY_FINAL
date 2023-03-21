package ITzy.OTT.dto;

import java.io.Serializable;

import com.mysql.cj.jdbc.Blob;

public class BbsDto implements Serializable{
	
	private int seq;		// sequence 글번호
	private String id;		// 작성자
	
	private int ref;		// 답글용	 	그룹번호(글번호)	
	private int step;		//			행번호
	private int depth;		//			깊이
	
	
	private String filename;	// 원본 파일명		abc.txt
	private String newfilename;	// 업로드 파일명   4543464.txt
	
	private String title;
	private String content;
	private String regdate;
	
	private int del;
	private int readcount;	// 조회수
	
	private Blob img;
	
	public BbsDto() {
	}

	public BbsDto(String id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}

	public BbsDto(int seq, String id, int ref, int step, int depth, String title, String content, String filename,
			String newfilename, String regdate, int del, int readcount, Blob img) {
		super();
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.newfilename = newfilename;		
		this.regdate = regdate;
		this.del = del;
		this.img = img;
		this.readcount = readcount;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getNewfilename() {
		return newfilename;
	}

	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}	

	public String getregdate() {
		return regdate;
	}

	public void setregdate(String regdate) {
		this.regdate = regdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Blob getImg() {
		return img;
	}

	public void setImg(Blob img) {
		this.img = img;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "BbsDto [seq=" + seq + ", id=" + id + ", ref=" + ref + ", step=" + step + ", depth=" + depth + ", title="
				+ title + ", content=" + content + ", filename=" + filename + ", newfilename=" + newfilename+ ", regdate="
				+ regdate + ", del=" + del + ", readcount=" + readcount + ", img=" + img
				+ "]";
	}

}