( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b961 - block
    b336 - block
    b915 - block
    b749 - block
    b818 - block
    b294 - block
    b936 - block
    b116 - block
    b769 - block
    b761 - block
    b995 - block
    b237 - block
    b120 - block
    b742 - block
    b195 - block
    b496 - block
    b287 - block
    b758 - block
    b292 - block
    b61 - block
    b535 - block
    b708 - block
    b925 - block
    b30 - block
    b410 - block
    b35 - block
    b964 - block
    b50 - block
    b782 - block
    b382 - block
    b396 - block
    b503 - block
    b38 - block
    b132 - block
    b602 - block
    b96 - block
    b291 - block
    b408 - block
    b539 - block
    b574 - block
    b127 - block
    b209 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b961 )
    ( on b336 b961 )
    ( on b915 b336 )
    ( on b749 b915 )
    ( on b818 b749 )
    ( on b294 b818 )
    ( on b936 b294 )
    ( on b116 b936 )
    ( on b769 b116 )
    ( on b761 b769 )
    ( on b995 b761 )
    ( on b237 b995 )
    ( on b120 b237 )
    ( on b742 b120 )
    ( on b195 b742 )
    ( on b496 b195 )
    ( on b287 b496 )
    ( on b758 b287 )
    ( on b292 b758 )
    ( on b61 b292 )
    ( on b535 b61 )
    ( on b708 b535 )
    ( on b925 b708 )
    ( on b30 b925 )
    ( on b410 b30 )
    ( on b35 b410 )
    ( on b964 b35 )
    ( on b50 b964 )
    ( on b782 b50 )
    ( on b382 b782 )
    ( on b396 b382 )
    ( on b503 b396 )
    ( on b38 b503 )
    ( on b132 b38 )
    ( on b602 b132 )
    ( on b96 b602 )
    ( on b291 b96 )
    ( on b408 b291 )
    ( on b539 b408 )
    ( on b574 b539 )
    ( on b127 b574 )
    ( on b209 b127 )
    ( clear b209 )
  )
  ( :goal
    ( and
      ( clear b961 )
    )
  )
)
