package org.vote.beans;


import java.util.Date;

/**
 * 活动信息表模型
 */
public class Activity {
  // 活动ID
  private String id;

  // 活动标题
  private String title;

  // 发布者ID
  private long publisher;

  // 条目称谓
  private String suffix;

  // 活动描述
  private String description;

  // 投票开始时间
  private Date voteTimeStart;

  // 投票截止时间
  private Date voteTimeEnd;

  // 报名开始时间
  private Date signUpTimeStart;

  // 报名截止时间
  private Date signUpTimeEnd;

  // 最多选择的条目数
  private int maxium;

  // 条目总数
  private int sumEntry;

  // 投票总数
  private long sumVoted;

  // 总访问量
  private long sumVisited;

  // 宣传图片地址
  private String imgAddr;

  // 其它必填项
  private String options;

  // 是否销毁
  private boolean destroyed;

  public Activity() {
    this.sumEntry = 0;
    this.sumVoted = 0;
    this.sumVisited = 0;
    this.destroyed = false;
  }

  /**
   * @return id
   */
  public String getId() {
    return id;
  }

  /**
   * @param id 要设置的 id
   */
  public void setId(String id) {
    this.id = id;
  }

  /**
   * @return title
   */
  public String getTitle() {
    return title;
  }

  /**
   * @param title 要设置的 title
   */
  public void setTitle(String title) {
    this.title = title;
  }

  /**
   * @return publisher
   */
  public long getPublisher() {
    return publisher;
  }

  /**
   * @param title 要设置的 title
   */
  public void setPublisher(long publisher) {
    this.publisher = publisher;
  }

  /**
   * @return suffix
   */
  public String getSuffix() {
    return suffix;
  }

  /**
   * @param suffix 要设置的 suffix
   */
  public void setSuffix(String suffix) {
    this.suffix = suffix;
  }

  /**
   * @return description
   */
  public String getDescription() {
    return description;
  }

  /**
   * @param description 要设置的 description
   */
  public void setDescription(String description) {
    this.description = description;
  }

  /**
   * @return voteTimeStart
   */
  public Date getVoteTimeStart() {
    return voteTimeStart;
  }

  /**
   * @param voteTimeStart 要设置的 voteTimeStart
   */
  public void setVoteTimeStart(Date voteTimeStart) {
    this.voteTimeStart = voteTimeStart;
  }

  /**
   * @return voteTimeEnd
   */
  public Date getVoteTimeEnd() {
    return voteTimeEnd;
  }

  /**
   * @param voteTimeEnd 要设置的 voteTimeEnd
   */
  public void setVoteTimeEnd(Date voteTimeEnd) {
    this.voteTimeEnd = voteTimeEnd;
  }

  /**
   * @return signUpTimeEnd
   */
  public Date getSignUpTimeEnd() {
    return signUpTimeEnd;
  }

  /**
   * @param signUpTimeEnd 要设置的 signUpTimeEnd
   */
  public void setSignUpTimeEnd(Date signUpTimeEnd) {
    this.signUpTimeEnd = signUpTimeEnd;
  }

  /**
   * @return signUpTimeStart
   */
  public Date getSignUpTimeStart() {
    return signUpTimeStart;
  }

  /**
   * @param signUpTimeStart 要设置的 signUpTimeStart
   */
  public void setSignUpTimeStart(Date signUpTimeStart) {
    this.signUpTimeStart = signUpTimeStart;
  }


  /**
   * @return maxium
   */
  public int getMaxium() {
    return maxium;
  }

  /**
   * @param maxium 要设置的 maxium
   */
  public void setMaxium(int maxium) {
    this.maxium = maxium;
  }

  /**
   * @return sumEntry
   */
  public int getSumEntry() {
    return sumEntry;
  }

  /**
   * @param sumEntry 要设置的 sumEntry
   */
  public void setSumEntry(int sumEntry) {
    this.sumEntry = sumEntry;
  }

  /**
   * @return sumVoted
   */
  public long getSumVoted() {
    return sumVoted;
  }

  /**
   * @param sumVoted 要设置的 sumVoted
   */
  public void setSumVoted(long sumVoted) {
    this.sumVoted = sumVoted;
  }

  /**
   * @return sumVisited
   */
  public long getSumVisited() {
    return sumVisited;
  }

  /**
   * @param sumVisited 要设置的 sumVisited
   */
  public void setSumVisited(long sumVisited) {
    this.sumVisited = sumVisited;
  }

  /**
   * @return imgAddr
   */
  public String getImgAddr() {
    return imgAddr;
  }

  /**
   * @param imgAddr 要设置的 imgAddr
   */
  public void setImgAddr(String imgAddr) {
    this.imgAddr = imgAddr;
  }

  /**
   * @return options
   */
  public String getOptions() {
    return options;
  }

  /**
   * @param options 要设置的 options
   */
  public void setOptions(String options) {
    this.options = options;
  }

  /**
   * @return destroyed
   */
  public boolean getDestroyed() {
    return destroyed;
  }

  /**
   * @param destroyed 要设置的 destroyed
   */
  public void setDestroyed(boolean destroyed) {
    this.destroyed = destroyed;
  }
}