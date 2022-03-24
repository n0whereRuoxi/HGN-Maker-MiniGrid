( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b49 - block
    b895 - block
    b377 - block
    b351 - block
    b732 - block
    b543 - block
    b166 - block
    b987 - block
    b755 - block
    b785 - block
    b469 - block
    b779 - block
    b236 - block
    b524 - block
    b982 - block
    b229 - block
    b642 - block
    b882 - block
    b548 - block
    b681 - block
    b158 - block
    b914 - block
    b402 - block
    b20 - block
    b858 - block
    b137 - block
    b430 - block
    b433 - block
    b592 - block
    b722 - block
    b925 - block
    b574 - block
    b682 - block
    b634 - block
    b250 - block
    b103 - block
    b422 - block
    b275 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b49 )
    ( on b895 b49 )
    ( on b377 b895 )
    ( on b351 b377 )
    ( on b732 b351 )
    ( on b543 b732 )
    ( on b166 b543 )
    ( on b987 b166 )
    ( on b755 b987 )
    ( on b785 b755 )
    ( on b469 b785 )
    ( on b779 b469 )
    ( on b236 b779 )
    ( on b524 b236 )
    ( on b982 b524 )
    ( on b229 b982 )
    ( on b642 b229 )
    ( on b882 b642 )
    ( on b548 b882 )
    ( on b681 b548 )
    ( on b158 b681 )
    ( on b914 b158 )
    ( on b402 b914 )
    ( on b20 b402 )
    ( on b858 b20 )
    ( on b137 b858 )
    ( on b430 b137 )
    ( on b433 b430 )
    ( on b592 b433 )
    ( on b722 b592 )
    ( on b925 b722 )
    ( on b574 b925 )
    ( on b682 b574 )
    ( on b634 b682 )
    ( on b250 b634 )
    ( on b103 b250 )
    ( on b422 b103 )
    ( on b275 b422 )
    ( clear b275 )
  )
  ( :goal
    ( and
      ( clear b49 )
    )
  )
)
