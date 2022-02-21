( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b480 - block
    b529 - block
    b993 - block
    b2 - block
    b328 - block
    b654 - block
    b886 - block
    b399 - block
    b385 - block
    b464 - block
    b562 - block
    b445 - block
    b440 - block
    b503 - block
    b832 - block
    b357 - block
    b369 - block
    b533 - block
    b37 - block
    b632 - block
    b531 - block
    b300 - block
    b936 - block
    b659 - block
    b255 - block
    b814 - block
    b260 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b480 )
    ( on b529 b480 )
    ( on b993 b529 )
    ( on b2 b993 )
    ( on b328 b2 )
    ( on b654 b328 )
    ( on b886 b654 )
    ( on b399 b886 )
    ( on b385 b399 )
    ( on b464 b385 )
    ( on b562 b464 )
    ( on b445 b562 )
    ( on b440 b445 )
    ( on b503 b440 )
    ( on b832 b503 )
    ( on b357 b832 )
    ( on b369 b357 )
    ( on b533 b369 )
    ( on b37 b533 )
    ( on b632 b37 )
    ( on b531 b632 )
    ( on b300 b531 )
    ( on b936 b300 )
    ( on b659 b936 )
    ( on b255 b659 )
    ( on b814 b255 )
    ( on b260 b814 )
    ( clear b260 )
  )
  ( :goal
    ( and
      ( clear b480 )
    )
  )
)
