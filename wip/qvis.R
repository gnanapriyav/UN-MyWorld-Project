slider_s <- input_slider(10, 100)
slider_o <- input_slider(0, 1, value = 0.5)

#qvis(p1, ~coeff, ~Indicator, size := slider_s, opacity := slider_o)
#creates a scatter plot with coeff on x axis and Indicator on y axis 
qvis(p1,~coeff,~Indicator,fill:="red")

#line graph but not cute
qvis(p1,~coeff,~Indicator,layers="path")

#changing the orientation
ggvis(p1, props(x = ~coeff, y = ~Indicator)) +
  layer_point() +
  guide_axis("x", orient = "top") +
  guide_axis("y", orient = "right")

#line graph
qvis(p1,~coeff,~Indicator,layers="path") +
  guide_axis("x", orient = "bottom",title = "Coefficient") +
  guide_axis("y", orient = "right",title = "World Bank Indicator") +
  guide_legend(fill = "fill", title = "Some interesting colours")

  