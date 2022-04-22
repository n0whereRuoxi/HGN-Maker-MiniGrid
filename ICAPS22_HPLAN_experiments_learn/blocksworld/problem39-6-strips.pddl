( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b443 - block
    b175 - block
    b87 - block
    b810 - block
    b565 - block
    b772 - block
    b899 - block
    b156 - block
    b106 - block
    b122 - block
    b333 - block
    b627 - block
    b576 - block
    b406 - block
    b961 - block
    b164 - block
    b917 - block
    b124 - block
    b746 - block
    b223 - block
    b109 - block
    b986 - block
    b246 - block
    b42 - block
    b453 - block
    b7 - block
    b229 - block
    b808 - block
    b277 - block
    b881 - block
    b975 - block
    b235 - block
    b100 - block
    b591 - block
    b842 - block
    b991 - block
    b985 - block
    b209 - block
    b508 - block
    b679 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b443 )
    ( on b175 b443 )
    ( on b87 b175 )
    ( on b810 b87 )
    ( on b565 b810 )
    ( on b772 b565 )
    ( on b899 b772 )
    ( on b156 b899 )
    ( on b106 b156 )
    ( on b122 b106 )
    ( on b333 b122 )
    ( on b627 b333 )
    ( on b576 b627 )
    ( on b406 b576 )
    ( on b961 b406 )
    ( on b164 b961 )
    ( on b917 b164 )
    ( on b124 b917 )
    ( on b746 b124 )
    ( on b223 b746 )
    ( on b109 b223 )
    ( on b986 b109 )
    ( on b246 b986 )
    ( on b42 b246 )
    ( on b453 b42 )
    ( on b7 b453 )
    ( on b229 b7 )
    ( on b808 b229 )
    ( on b277 b808 )
    ( on b881 b277 )
    ( on b975 b881 )
    ( on b235 b975 )
    ( on b100 b235 )
    ( on b591 b100 )
    ( on b842 b591 )
    ( on b991 b842 )
    ( on b985 b991 )
    ( on b209 b985 )
    ( on b508 b209 )
    ( on b679 b508 )
    ( clear b679 )
  )
  ( :goal
    ( and
      ( clear b443 )
    )
  )
)
