( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b802 - block
    b656 - block
    b7 - block
    b861 - block
    b727 - block
    b906 - block
    b275 - block
    b610 - block
    b845 - block
    b651 - block
    b852 - block
    b681 - block
    b212 - block
    b676 - block
    b742 - block
    b334 - block
    b722 - block
    b316 - block
    b875 - block
    b746 - block
    b759 - block
    b481 - block
    b78 - block
    b443 - block
    b649 - block
    b748 - block
    b915 - block
    b539 - block
    b117 - block
    b882 - block
    b480 - block
    b259 - block
    b168 - block
    b699 - block
    b810 - block
    b415 - block
    b970 - block
    b944 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b802 )
    ( on b656 b802 )
    ( on b7 b656 )
    ( on b861 b7 )
    ( on b727 b861 )
    ( on b906 b727 )
    ( on b275 b906 )
    ( on b610 b275 )
    ( on b845 b610 )
    ( on b651 b845 )
    ( on b852 b651 )
    ( on b681 b852 )
    ( on b212 b681 )
    ( on b676 b212 )
    ( on b742 b676 )
    ( on b334 b742 )
    ( on b722 b334 )
    ( on b316 b722 )
    ( on b875 b316 )
    ( on b746 b875 )
    ( on b759 b746 )
    ( on b481 b759 )
    ( on b78 b481 )
    ( on b443 b78 )
    ( on b649 b443 )
    ( on b748 b649 )
    ( on b915 b748 )
    ( on b539 b915 )
    ( on b117 b539 )
    ( on b882 b117 )
    ( on b480 b882 )
    ( on b259 b480 )
    ( on b168 b259 )
    ( on b699 b168 )
    ( on b810 b699 )
    ( on b415 b810 )
    ( on b970 b415 )
    ( on b944 b970 )
    ( clear b944 )
  )
  ( :goal
    ( and
      ( clear b802 )
    )
  )
)
