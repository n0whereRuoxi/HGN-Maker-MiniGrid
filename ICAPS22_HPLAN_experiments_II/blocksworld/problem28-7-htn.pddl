( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b137 - block
    b518 - block
    b502 - block
    b988 - block
    b243 - block
    b888 - block
    b623 - block
    b681 - block
    b379 - block
    b666 - block
    b297 - block
    b590 - block
    b161 - block
    b907 - block
    b3 - block
    b69 - block
    b838 - block
    b958 - block
    b999 - block
    b634 - block
    b168 - block
    b315 - block
    b107 - block
    b546 - block
    b453 - block
    b616 - block
    b448 - block
    b498 - block
    b322 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b137 )
    ( on b518 b137 )
    ( on b502 b518 )
    ( on b988 b502 )
    ( on b243 b988 )
    ( on b888 b243 )
    ( on b623 b888 )
    ( on b681 b623 )
    ( on b379 b681 )
    ( on b666 b379 )
    ( on b297 b666 )
    ( on b590 b297 )
    ( on b161 b590 )
    ( on b907 b161 )
    ( on b3 b907 )
    ( on b69 b3 )
    ( on b838 b69 )
    ( on b958 b838 )
    ( on b999 b958 )
    ( on b634 b999 )
    ( on b168 b634 )
    ( on b315 b168 )
    ( on b107 b315 )
    ( on b546 b107 )
    ( on b453 b546 )
    ( on b616 b453 )
    ( on b448 b616 )
    ( on b498 b448 )
    ( on b322 b498 )
    ( clear b322 )
  )
  ( :tasks
    ( Make-28Pile b518 b502 b988 b243 b888 b623 b681 b379 b666 b297 b590 b161 b907 b3 b69 b838 b958 b999 b634 b168 b315 b107 b546 b453 b616 b448 b498 b322 )
  )
)
