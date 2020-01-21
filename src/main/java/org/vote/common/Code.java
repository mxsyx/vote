package org.vote.common;

import java.util.HashMap;

/**
 * Servlet 返回码类
 */
public class Code {
  // 返回码
  private int code;

  // 返回码说明
  private String codeDesc;

  // 返回码映射
  private static HashMap<Integer, String> codes;

  public static void initCodes() {
    codes = new HashMap<Integer, String>();

    // 发布功能返回码
    codes.put(1000, "发布投票成功");
    codes.put(1001, "发布投票失败原因未知");
    codes.put(1002, "图片文件后缀名只能为.jpg/.png");

    // 发布功能返回码
    codes.put(1900, "删除投票成功");
    codes.put(1901, "删除投票失败原因未知");
  }

  public Code(int code) {
    this.code = code;
    codeDesc = codes.get(code);
  }

  /**
   * @return code
   */
  public int getCode() {
    return code;
  }

  /**
   * @param code 要设置的 code
   */
  public void setCode(int code) {
    this.code = code;
  }

  /**
   * @return codeDesc
   */
  public String getCodeDesc() {
    return codeDesc;
  }

  /**
   * @param codeDesc 要设置的 codeDesc
   */
  public void setCodeDesc(String codeDesc) {
    this.codeDesc = codeDesc;
  }
}