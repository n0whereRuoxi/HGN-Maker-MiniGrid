( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b815 - block
    b993 - block
    b711 - block
    b12 - block
    b640 - block
    b818 - block
    b924 - block
    b965 - block
    b499 - block
    b303 - block
    b278 - block
    b747 - block
    b657 - block
    b228 - block
    b798 - block
    b117 - block
    b871 - block
    b382 - block
    b574 - block
    b907 - block
    b608 - block
    b658 - block
    b69 - block
    b775 - block
    b81 - block
    b308 - block
    b812 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b815 )
    ( on b993 b815 )
    ( on b711 b993 )
    ( on b12 b711 )
    ( on b640 b12 )
    ( on b818 b640 )
    ( on b924 b818 )
    ( on b965 b924 )
    ( on b499 b965 )
    ( on b303 b499 )
    ( on b278 b303 )
    ( on b747 b278 )
    ( on b657 b747 )
    ( on b228 b657 )
    ( on b798 b228 )
    ( on b117 b798 )
    ( on b871 b117 )
    ( on b382 b871 )
    ( on b574 b382 )
    ( on b907 b574 )
    ( on b608 b907 )
    ( on b658 b608 )
    ( on b69 b658 )
    ( on b775 b69 )
    ( on b81 b775 )
    ( on b308 b81 )
    ( on b812 b308 )
    ( clear b812 )
  )
  ( :goal
    ( and
      ( clear b815 )
    )
  )
)
