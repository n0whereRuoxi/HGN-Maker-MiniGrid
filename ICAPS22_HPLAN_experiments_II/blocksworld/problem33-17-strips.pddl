( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b416 - block
    b975 - block
    b972 - block
    b684 - block
    b260 - block
    b957 - block
    b572 - block
    b120 - block
    b888 - block
    b43 - block
    b317 - block
    b229 - block
    b22 - block
    b195 - block
    b170 - block
    b668 - block
    b386 - block
    b146 - block
    b32 - block
    b832 - block
    b812 - block
    b785 - block
    b174 - block
    b107 - block
    b235 - block
    b548 - block
    b42 - block
    b408 - block
    b305 - block
    b923 - block
    b539 - block
    b414 - block
    b955 - block
    b952 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b416 )
    ( on b975 b416 )
    ( on b972 b975 )
    ( on b684 b972 )
    ( on b260 b684 )
    ( on b957 b260 )
    ( on b572 b957 )
    ( on b120 b572 )
    ( on b888 b120 )
    ( on b43 b888 )
    ( on b317 b43 )
    ( on b229 b317 )
    ( on b22 b229 )
    ( on b195 b22 )
    ( on b170 b195 )
    ( on b668 b170 )
    ( on b386 b668 )
    ( on b146 b386 )
    ( on b32 b146 )
    ( on b832 b32 )
    ( on b812 b832 )
    ( on b785 b812 )
    ( on b174 b785 )
    ( on b107 b174 )
    ( on b235 b107 )
    ( on b548 b235 )
    ( on b42 b548 )
    ( on b408 b42 )
    ( on b305 b408 )
    ( on b923 b305 )
    ( on b539 b923 )
    ( on b414 b539 )
    ( on b955 b414 )
    ( on b952 b955 )
    ( clear b952 )
  )
  ( :goal
    ( and
      ( clear b416 )
    )
  )
)
