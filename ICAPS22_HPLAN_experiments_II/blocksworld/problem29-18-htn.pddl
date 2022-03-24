( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b666 - block
    b439 - block
    b91 - block
    b915 - block
    b758 - block
    b344 - block
    b388 - block
    b811 - block
    b561 - block
    b963 - block
    b656 - block
    b970 - block
    b442 - block
    b328 - block
    b564 - block
    b291 - block
    b695 - block
    b965 - block
    b547 - block
    b245 - block
    b401 - block
    b729 - block
    b1 - block
    b384 - block
    b664 - block
    b673 - block
    b923 - block
    b170 - block
    b817 - block
    b474 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b666 )
    ( on b439 b666 )
    ( on b91 b439 )
    ( on b915 b91 )
    ( on b758 b915 )
    ( on b344 b758 )
    ( on b388 b344 )
    ( on b811 b388 )
    ( on b561 b811 )
    ( on b963 b561 )
    ( on b656 b963 )
    ( on b970 b656 )
    ( on b442 b970 )
    ( on b328 b442 )
    ( on b564 b328 )
    ( on b291 b564 )
    ( on b695 b291 )
    ( on b965 b695 )
    ( on b547 b965 )
    ( on b245 b547 )
    ( on b401 b245 )
    ( on b729 b401 )
    ( on b1 b729 )
    ( on b384 b1 )
    ( on b664 b384 )
    ( on b673 b664 )
    ( on b923 b673 )
    ( on b170 b923 )
    ( on b817 b170 )
    ( on b474 b817 )
    ( clear b474 )
  )
  ( :tasks
    ( Make-29Pile b439 b91 b915 b758 b344 b388 b811 b561 b963 b656 b970 b442 b328 b564 b291 b695 b965 b547 b245 b401 b729 b1 b384 b664 b673 b923 b170 b817 b474 )
  )
)
