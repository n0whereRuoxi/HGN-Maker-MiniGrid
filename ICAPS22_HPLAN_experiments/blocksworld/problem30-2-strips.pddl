( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b298 - block
    b793 - block
    b679 - block
    b173 - block
    b924 - block
    b63 - block
    b121 - block
    b960 - block
    b45 - block
    b437 - block
    b46 - block
    b80 - block
    b90 - block
    b293 - block
    b835 - block
    b964 - block
    b840 - block
    b130 - block
    b201 - block
    b555 - block
    b708 - block
    b968 - block
    b762 - block
    b462 - block
    b787 - block
    b825 - block
    b685 - block
    b354 - block
    b690 - block
    b211 - block
    b391 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b298 )
    ( on b793 b298 )
    ( on b679 b793 )
    ( on b173 b679 )
    ( on b924 b173 )
    ( on b63 b924 )
    ( on b121 b63 )
    ( on b960 b121 )
    ( on b45 b960 )
    ( on b437 b45 )
    ( on b46 b437 )
    ( on b80 b46 )
    ( on b90 b80 )
    ( on b293 b90 )
    ( on b835 b293 )
    ( on b964 b835 )
    ( on b840 b964 )
    ( on b130 b840 )
    ( on b201 b130 )
    ( on b555 b201 )
    ( on b708 b555 )
    ( on b968 b708 )
    ( on b762 b968 )
    ( on b462 b762 )
    ( on b787 b462 )
    ( on b825 b787 )
    ( on b685 b825 )
    ( on b354 b685 )
    ( on b690 b354 )
    ( on b211 b690 )
    ( on b391 b211 )
    ( clear b391 )
  )
  ( :goal
    ( and
      ( clear b298 )
    )
  )
)
