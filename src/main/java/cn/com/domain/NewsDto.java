package cn.com.domain;

public class NewsDto {
   private String title;
   private Integer categoryId;
   private String author; 
   private String content;
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public Integer getCategoryId() {
	return categoryId;
}
public void setCategoryId(Integer categoryId) {
	this.categoryId = categoryId;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
@Override
public String toString() {
	return "NewsDto [title=" + title + ", categoryId=" + categoryId + ", author=" + author + ", content=" + content
			+ "]";
}
   
} 
