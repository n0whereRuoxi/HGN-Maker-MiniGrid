( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b969 - block
    b278 - block
    b859 - block
    b709 - block
    b682 - block
    b342 - block
    b68 - block
    b914 - block
    b629 - block
    b995 - block
    b574 - block
    b291 - block
    b817 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b969 )
    ( on b278 b969 )
    ( on b859 b278 )
    ( on b709 b859 )
    ( on b682 b709 )
    ( on b342 b682 )
    ( on b68 b342 )
    ( on b914 b68 )
    ( on b629 b914 )
    ( on b995 b629 )
    ( on b574 b995 )
    ( on b291 b574 )
    ( on b817 b291 )
    ( clear b817 )
  )
  ( :goal
    ( and
      ( clear b969 )
    )
  )
)
