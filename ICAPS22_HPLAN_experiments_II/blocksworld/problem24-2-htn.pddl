( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b135 - block
    b680 - block
    b509 - block
    b514 - block
    b971 - block
    b607 - block
    b916 - block
    b12 - block
    b841 - block
    b85 - block
    b952 - block
    b857 - block
    b897 - block
    b192 - block
    b933 - block
    b652 - block
    b485 - block
    b556 - block
    b392 - block
    b453 - block
    b369 - block
    b855 - block
    b44 - block
    b97 - block
    b415 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b135 )
    ( on b680 b135 )
    ( on b509 b680 )
    ( on b514 b509 )
    ( on b971 b514 )
    ( on b607 b971 )
    ( on b916 b607 )
    ( on b12 b916 )
    ( on b841 b12 )
    ( on b85 b841 )
    ( on b952 b85 )
    ( on b857 b952 )
    ( on b897 b857 )
    ( on b192 b897 )
    ( on b933 b192 )
    ( on b652 b933 )
    ( on b485 b652 )
    ( on b556 b485 )
    ( on b392 b556 )
    ( on b453 b392 )
    ( on b369 b453 )
    ( on b855 b369 )
    ( on b44 b855 )
    ( on b97 b44 )
    ( on b415 b97 )
    ( clear b415 )
  )
  ( :tasks
    ( Make-24Pile b680 b509 b514 b971 b607 b916 b12 b841 b85 b952 b857 b897 b192 b933 b652 b485 b556 b392 b453 b369 b855 b44 b97 b415 )
  )
)
