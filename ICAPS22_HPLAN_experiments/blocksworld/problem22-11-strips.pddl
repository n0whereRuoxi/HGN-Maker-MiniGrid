( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b803 - block
    b880 - block
    b330 - block
    b741 - block
    b705 - block
    b255 - block
    b509 - block
    b735 - block
    b277 - block
    b573 - block
    b534 - block
    b814 - block
    b197 - block
    b976 - block
    b460 - block
    b988 - block
    b570 - block
    b4 - block
    b266 - block
    b369 - block
    b182 - block
    b614 - block
    b479 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b803 )
    ( on b880 b803 )
    ( on b330 b880 )
    ( on b741 b330 )
    ( on b705 b741 )
    ( on b255 b705 )
    ( on b509 b255 )
    ( on b735 b509 )
    ( on b277 b735 )
    ( on b573 b277 )
    ( on b534 b573 )
    ( on b814 b534 )
    ( on b197 b814 )
    ( on b976 b197 )
    ( on b460 b976 )
    ( on b988 b460 )
    ( on b570 b988 )
    ( on b4 b570 )
    ( on b266 b4 )
    ( on b369 b266 )
    ( on b182 b369 )
    ( on b614 b182 )
    ( on b479 b614 )
    ( clear b479 )
  )
  ( :goal
    ( and
      ( clear b803 )
    )
  )
)
