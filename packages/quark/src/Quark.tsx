import React from "react";

//Used to add functionality for base components

const NODES = ["div", "span", "button", "ul"] as const;

type QuarkProps<E extends React.ElementType> = React.ComponentPropsWithRef<E>;

type QuarkForwardRefComponent<E extends React.ElementType> =
  React.ForwardRefExoticComponent<QuarkProps<E>>;

type Quarks = { [E in typeof NODES[number]]: QuarkForwardRefComponent<E> };

export const quark = NODES.reduce(
  (quarks, node) => ({
    ...quarks,
    [node]: React.forwardRef(
      (props: QuarkProps<typeof node>, forwardedRef: any) => {
        const Component = node as any;

        return <Component {...props} ref={forwardedRef} />;
      }
    ),
  }),
  {} as Quarks
);
