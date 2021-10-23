---
to: packages/<%= name %>/src/<%= ComponentName = h.changeCase.pascal(name) %>.tsx
---
<% ComponentProps = ComponentName + "Props" _%>
import { ReactNode } from "react";

type <%= ComponentProps %> = {
	children?: ReactNode;
};

export const <%= ComponentName %> = (props: <%= ComponentProps %>) => {
	return props.children;
};

