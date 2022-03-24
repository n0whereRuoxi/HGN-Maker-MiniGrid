( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b466 - block
    b705 - block
    b779 - block
    b792 - block
    b735 - block
    b676 - block
    b742 - block
    b823 - block
    b881 - block
    b123 - block
    b586 - block
    b863 - block
    b100 - block
    b723 - block
    b250 - block
    b719 - block
    b764 - block
    b214 - block
    b674 - block
    b621 - block
    b776 - block
    b593 - block
    b656 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b466 )
    ( on b705 b466 )
    ( on b779 b705 )
    ( on b792 b779 )
    ( on b735 b792 )
    ( on b676 b735 )
    ( on b742 b676 )
    ( on b823 b742 )
    ( on b881 b823 )
    ( on b123 b881 )
    ( on b586 b123 )
    ( on b863 b586 )
    ( on b100 b863 )
    ( on b723 b100 )
    ( on b250 b723 )
    ( on b719 b250 )
    ( on b764 b719 )
    ( on b214 b764 )
    ( on b674 b214 )
    ( on b621 b674 )
    ( on b776 b621 )
    ( on b593 b776 )
    ( on b656 b593 )
    ( clear b656 )
  )
  ( :tasks
    ( Make-22Pile b705 b779 b792 b735 b676 b742 b823 b881 b123 b586 b863 b100 b723 b250 b719 b764 b214 b674 b621 b776 b593 b656 )
  )
)
