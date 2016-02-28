package com.tanlan.cdetc.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.htmlparser.Parser;
import org.htmlparser.util.ParserException;
import org.htmlparser.visitors.TextExtractingVisitor;

public class FormatTag extends SimpleTagSupport {
	private String value;
	private boolean escapeHTML = false;
	private int remainLength = 0;
	private boolean removeParag = false;

	@Override
	public void doTag() throws JspException, IOException {
		if (escapeHTML) {
			Parser parser;
			try {
				parser = new Parser(value);
				TextExtractingVisitor visitor = new TextExtractingVisitor();
				parser.visitAllNodesWith(visitor);
				value = visitor.getExtractedText();
			} catch (ParserException e) {
				e.printStackTrace();
			}

			// value = value.replaceAll("<[A-z/ =']*>", "");
		}
		if (remainLength != 0) {
			value = value.substring(0,
					remainLength > value.length() ? value.length()
							: remainLength);
		}
		if (removeParag) {
			if (value.length() >= 6) {
				value = value.substring(3, value.length() - 4);
			}
		}
		getJspContext().getOut().write(value);
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public boolean isEscapeHTML() {
		return escapeHTML;
	}

	public void setEscapeHTML(boolean escapeHTML) {
		this.escapeHTML = escapeHTML;
	}

	public int getRemainLength() {
		return remainLength;
	}

	public void setRemainLength(int remainLength) {
		this.remainLength = remainLength;
	}

	public boolean isRemoveParag() {
		return removeParag;
	}

	public void setRemoveParag(boolean removeParag) {
		this.removeParag = removeParag;
	}
}
