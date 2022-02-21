( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b132 - block
    b188 - block
    b192 - block
    b769 - block
    b671 - block
    b806 - block
    b168 - block
    b790 - block
    b618 - block
    b68 - block
    b640 - block
    b846 - block
    b672 - block
    b501 - block
    b659 - block
    b669 - block
    b889 - block
    b825 - block
    b686 - block
    b143 - block
    b521 - block
    b617 - block
    b949 - block
    b160 - block
    b333 - block
    b166 - block
    b688 - block
    b476 - block
    b400 - block
    b311 - block
    b577 - block
    b2 - block
    b962 - block
    b49 - block
    b464 - block
    b291 - block
    b701 - block
    b883 - block
    b269 - block
    b576 - block
    b819 - block
    b676 - block
    b461 - block
    b709 - block
    b805 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b132 )
    ( on b188 b132 )
    ( on b192 b188 )
    ( on b769 b192 )
    ( on b671 b769 )
    ( on b806 b671 )
    ( on b168 b806 )
    ( on b790 b168 )
    ( on b618 b790 )
    ( on b68 b618 )
    ( on b640 b68 )
    ( on b846 b640 )
    ( on b672 b846 )
    ( on b501 b672 )
    ( on b659 b501 )
    ( on b669 b659 )
    ( on b889 b669 )
    ( on b825 b889 )
    ( on b686 b825 )
    ( on b143 b686 )
    ( on b521 b143 )
    ( on b617 b521 )
    ( on b949 b617 )
    ( on b160 b949 )
    ( on b333 b160 )
    ( on b166 b333 )
    ( on b688 b166 )
    ( on b476 b688 )
    ( on b400 b476 )
    ( on b311 b400 )
    ( on b577 b311 )
    ( on b2 b577 )
    ( on b962 b2 )
    ( on b49 b962 )
    ( on b464 b49 )
    ( on b291 b464 )
    ( on b701 b291 )
    ( on b883 b701 )
    ( on b269 b883 )
    ( on b576 b269 )
    ( on b819 b576 )
    ( on b676 b819 )
    ( on b461 b676 )
    ( on b709 b461 )
    ( on b805 b709 )
    ( clear b805 )
  )
  ( :goal
    ( and
      ( clear b132 )
    )
  )
)
