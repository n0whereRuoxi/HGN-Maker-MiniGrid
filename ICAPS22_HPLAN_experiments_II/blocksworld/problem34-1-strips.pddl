( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b207 - block
    b61 - block
    b572 - block
    b571 - block
    b48 - block
    b195 - block
    b767 - block
    b495 - block
    b49 - block
    b847 - block
    b115 - block
    b462 - block
    b607 - block
    b944 - block
    b270 - block
    b990 - block
    b45 - block
    b248 - block
    b764 - block
    b611 - block
    b814 - block
    b139 - block
    b890 - block
    b578 - block
    b811 - block
    b575 - block
    b597 - block
    b116 - block
    b168 - block
    b618 - block
    b188 - block
    b158 - block
    b293 - block
    b478 - block
    b496 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b207 )
    ( on b61 b207 )
    ( on b572 b61 )
    ( on b571 b572 )
    ( on b48 b571 )
    ( on b195 b48 )
    ( on b767 b195 )
    ( on b495 b767 )
    ( on b49 b495 )
    ( on b847 b49 )
    ( on b115 b847 )
    ( on b462 b115 )
    ( on b607 b462 )
    ( on b944 b607 )
    ( on b270 b944 )
    ( on b990 b270 )
    ( on b45 b990 )
    ( on b248 b45 )
    ( on b764 b248 )
    ( on b611 b764 )
    ( on b814 b611 )
    ( on b139 b814 )
    ( on b890 b139 )
    ( on b578 b890 )
    ( on b811 b578 )
    ( on b575 b811 )
    ( on b597 b575 )
    ( on b116 b597 )
    ( on b168 b116 )
    ( on b618 b168 )
    ( on b188 b618 )
    ( on b158 b188 )
    ( on b293 b158 )
    ( on b478 b293 )
    ( on b496 b478 )
    ( clear b496 )
  )
  ( :goal
    ( and
      ( clear b207 )
    )
  )
)
