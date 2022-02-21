( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b195 - block
    b994 - block
    b999 - block
    b504 - block
    b501 - block
    b352 - block
    b52 - block
    b122 - block
    b902 - block
    b50 - block
    b336 - block
    b633 - block
    b842 - block
    b317 - block
    b711 - block
    b582 - block
    b721 - block
    b130 - block
    b376 - block
    b127 - block
    b964 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b195 )
    ( on b994 b195 )
    ( on b999 b994 )
    ( on b504 b999 )
    ( on b501 b504 )
    ( on b352 b501 )
    ( on b52 b352 )
    ( on b122 b52 )
    ( on b902 b122 )
    ( on b50 b902 )
    ( on b336 b50 )
    ( on b633 b336 )
    ( on b842 b633 )
    ( on b317 b842 )
    ( on b711 b317 )
    ( on b582 b711 )
    ( on b721 b582 )
    ( on b130 b721 )
    ( on b376 b130 )
    ( on b127 b376 )
    ( on b964 b127 )
    ( clear b964 )
  )
  ( :goal
    ( and
      ( clear b195 )
    )
  )
)
