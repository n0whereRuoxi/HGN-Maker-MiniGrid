( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b284 - block
    b135 - block
    b626 - block
    b353 - block
    b90 - block
    b512 - block
    b685 - block
    b677 - block
    b907 - block
    b954 - block
    b231 - block
    b842 - block
    b789 - block
    b450 - block
    b492 - block
    b886 - block
    b826 - block
    b356 - block
    b398 - block
    b362 - block
    b377 - block
    b691 - block
    b32 - block
    b790 - block
    b937 - block
    b809 - block
    b370 - block
    b648 - block
    b726 - block
    b548 - block
    b178 - block
    b452 - block
    b218 - block
    b209 - block
    b614 - block
    b773 - block
    b331 - block
    b996 - block
    b138 - block
    b251 - block
    b794 - block
    b911 - block
    b425 - block
    b191 - block
    b116 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b284 )
    ( on b135 b284 )
    ( on b626 b135 )
    ( on b353 b626 )
    ( on b90 b353 )
    ( on b512 b90 )
    ( on b685 b512 )
    ( on b677 b685 )
    ( on b907 b677 )
    ( on b954 b907 )
    ( on b231 b954 )
    ( on b842 b231 )
    ( on b789 b842 )
    ( on b450 b789 )
    ( on b492 b450 )
    ( on b886 b492 )
    ( on b826 b886 )
    ( on b356 b826 )
    ( on b398 b356 )
    ( on b362 b398 )
    ( on b377 b362 )
    ( on b691 b377 )
    ( on b32 b691 )
    ( on b790 b32 )
    ( on b937 b790 )
    ( on b809 b937 )
    ( on b370 b809 )
    ( on b648 b370 )
    ( on b726 b648 )
    ( on b548 b726 )
    ( on b178 b548 )
    ( on b452 b178 )
    ( on b218 b452 )
    ( on b209 b218 )
    ( on b614 b209 )
    ( on b773 b614 )
    ( on b331 b773 )
    ( on b996 b331 )
    ( on b138 b996 )
    ( on b251 b138 )
    ( on b794 b251 )
    ( on b911 b794 )
    ( on b425 b911 )
    ( on b191 b425 )
    ( on b116 b191 )
    ( clear b116 )
  )
  ( :goal
    ( and
      ( clear b284 )
    )
  )
)
