( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b647 - block
    b919 - block
    b292 - block
    b911 - block
    b907 - block
    b178 - block
    b862 - block
    b260 - block
    b518 - block
    b110 - block
    b56 - block
    b846 - block
    b130 - block
    b851 - block
    b396 - block
    b973 - block
    b180 - block
    b993 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b647 )
    ( on b919 b647 )
    ( on b292 b919 )
    ( on b911 b292 )
    ( on b907 b911 )
    ( on b178 b907 )
    ( on b862 b178 )
    ( on b260 b862 )
    ( on b518 b260 )
    ( on b110 b518 )
    ( on b56 b110 )
    ( on b846 b56 )
    ( on b130 b846 )
    ( on b851 b130 )
    ( on b396 b851 )
    ( on b973 b396 )
    ( on b180 b973 )
    ( on b993 b180 )
    ( clear b993 )
  )
  ( :goal
    ( and
      ( clear b647 )
    )
  )
)
