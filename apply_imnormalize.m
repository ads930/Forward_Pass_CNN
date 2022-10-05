function outarray = apply_imnormalize(inarray)

outarray = inarray./255.0 - 0.5;

end