# Resize horizontally current window
def resize_left(qtile):
    layout = qtile.current_layout
    child = layout.current # _BspNode
    parent = child.parent

    while parent:
        if parent.split_horizontal and child is parent.children[1]:
            parent.split_ratio = max(5, parent.split_ratio - layout.grow_amount)
            layout.group.layout_all()
            break
        elif parent.split_horizontal and child is parent.children[0]:
            parent.split_ratio = min(95, parent.split_ratio - layout.grow_amount)
            layout.group.layout_all()
            break
        child = parent
        parent = child.parent

def resize_right(qtile):
    layout = qtile.current_layout
    child = layout.current # _BspNode
    parent = child.parent

    while parent:
        if parent.split_horizontal and child is parent.children[1]:
            parent.split_ratio = min(95, parent.split_ratio + layout.grow_amount)
            layout.group.layout_all()
            break
        elif parent.split_horizontal and child is parent.children[0]:
            parent.split_ratio = max(5, parent.split_ratio + layout.grow_amount)
            layout.group.layout_all()
            break
        child = parent
        parent = child.parent
