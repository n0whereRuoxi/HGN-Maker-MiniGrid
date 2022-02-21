( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b325 - block
    b587 - block
    b36 - block
    b588 - block
    b761 - block
    b390 - block
    b377 - block
    b523 - block
    b607 - block
    b371 - block
    b668 - block
    b358 - block
    b104 - block
    b297 - block
    b407 - block
    b994 - block
    b673 - block
    b168 - block
    b796 - block
    b707 - block
    b670 - block
    b329 - block
    b293 - block
    b549 - block
    b633 - block
    b828 - block
    b762 - block
    b648 - block
    b492 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b325 )
    ( on b587 b325 )
    ( on b36 b587 )
    ( on b588 b36 )
    ( on b761 b588 )
    ( on b390 b761 )
    ( on b377 b390 )
    ( on b523 b377 )
    ( on b607 b523 )
    ( on b371 b607 )
    ( on b668 b371 )
    ( on b358 b668 )
    ( on b104 b358 )
    ( on b297 b104 )
    ( on b407 b297 )
    ( on b994 b407 )
    ( on b673 b994 )
    ( on b168 b673 )
    ( on b796 b168 )
    ( on b707 b796 )
    ( on b670 b707 )
    ( on b329 b670 )
    ( on b293 b329 )
    ( on b549 b293 )
    ( on b633 b549 )
    ( on b828 b633 )
    ( on b762 b828 )
    ( on b648 b762 )
    ( on b492 b648 )
    ( clear b492 )
  )
  ( :goal
    ( and
      ( clear b325 )
    )
  )
)
