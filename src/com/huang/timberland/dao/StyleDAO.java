package com.huang.timberland.dao;

import com.huang.timberland.domain.Cloth;
import com.huang.timberland.domain.Style;

import java.util.List;

public interface StyleDAO {

    List<Style> getStyles(int clothId);

    Style getStyle(int styleId);
}
