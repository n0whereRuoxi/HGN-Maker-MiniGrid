( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b830 - block
    b329 - block
    b728 - block
    b497 - block
    b501 - block
    b374 - block
    b363 - block
    b454 - block
    b75 - block
    b838 - block
    b958 - block
    b913 - block
    b100 - block
    b377 - block
    b853 - block
    b544 - block
    b369 - block
    b202 - block
    b628 - block
    b366 - block
    b943 - block
    b443 - block
    b253 - block
    b959 - block
    b759 - block
    b774 - block
    b391 - block
    b701 - block
    b444 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b830 )
    ( on b329 b830 )
    ( on b728 b329 )
    ( on b497 b728 )
    ( on b501 b497 )
    ( on b374 b501 )
    ( on b363 b374 )
    ( on b454 b363 )
    ( on b75 b454 )
    ( on b838 b75 )
    ( on b958 b838 )
    ( on b913 b958 )
    ( on b100 b913 )
    ( on b377 b100 )
    ( on b853 b377 )
    ( on b544 b853 )
    ( on b369 b544 )
    ( on b202 b369 )
    ( on b628 b202 )
    ( on b366 b628 )
    ( on b943 b366 )
    ( on b443 b943 )
    ( on b253 b443 )
    ( on b959 b253 )
    ( on b759 b959 )
    ( on b774 b759 )
    ( on b391 b774 )
    ( on b701 b391 )
    ( on b444 b701 )
    ( clear b444 )
  )
  ( :goal
    ( and
      ( clear b830 )
    )
  )
)
