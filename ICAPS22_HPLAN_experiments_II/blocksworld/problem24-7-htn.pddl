( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b413 - block
    b148 - block
    b708 - block
    b673 - block
    b483 - block
    b303 - block
    b553 - block
    b755 - block
    b546 - block
    b902 - block
    b376 - block
    b857 - block
    b759 - block
    b207 - block
    b369 - block
    b261 - block
    b132 - block
    b696 - block
    b614 - block
    b394 - block
    b582 - block
    b424 - block
    b147 - block
    b806 - block
    b383 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b413 )
    ( on b148 b413 )
    ( on b708 b148 )
    ( on b673 b708 )
    ( on b483 b673 )
    ( on b303 b483 )
    ( on b553 b303 )
    ( on b755 b553 )
    ( on b546 b755 )
    ( on b902 b546 )
    ( on b376 b902 )
    ( on b857 b376 )
    ( on b759 b857 )
    ( on b207 b759 )
    ( on b369 b207 )
    ( on b261 b369 )
    ( on b132 b261 )
    ( on b696 b132 )
    ( on b614 b696 )
    ( on b394 b614 )
    ( on b582 b394 )
    ( on b424 b582 )
    ( on b147 b424 )
    ( on b806 b147 )
    ( on b383 b806 )
    ( clear b383 )
  )
  ( :tasks
    ( Make-24Pile b148 b708 b673 b483 b303 b553 b755 b546 b902 b376 b857 b759 b207 b369 b261 b132 b696 b614 b394 b582 b424 b147 b806 b383 )
  )
)
