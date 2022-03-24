( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b140 - block
    b480 - block
    b385 - block
    b992 - block
    b712 - block
    b986 - block
    b309 - block
    b998 - block
    b991 - block
    b130 - block
    b8 - block
    b710 - block
    b332 - block
    b90 - block
    b112 - block
    b210 - block
    b429 - block
    b753 - block
    b7 - block
    b607 - block
    b814 - block
    b659 - block
    b467 - block
    b323 - block
    b49 - block
    b649 - block
    b142 - block
    b546 - block
    b540 - block
    b370 - block
    b578 - block
    b227 - block
    b890 - block
    b957 - block
    b67 - block
    b22 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b140 )
    ( on b480 b140 )
    ( on b385 b480 )
    ( on b992 b385 )
    ( on b712 b992 )
    ( on b986 b712 )
    ( on b309 b986 )
    ( on b998 b309 )
    ( on b991 b998 )
    ( on b130 b991 )
    ( on b8 b130 )
    ( on b710 b8 )
    ( on b332 b710 )
    ( on b90 b332 )
    ( on b112 b90 )
    ( on b210 b112 )
    ( on b429 b210 )
    ( on b753 b429 )
    ( on b7 b753 )
    ( on b607 b7 )
    ( on b814 b607 )
    ( on b659 b814 )
    ( on b467 b659 )
    ( on b323 b467 )
    ( on b49 b323 )
    ( on b649 b49 )
    ( on b142 b649 )
    ( on b546 b142 )
    ( on b540 b546 )
    ( on b370 b540 )
    ( on b578 b370 )
    ( on b227 b578 )
    ( on b890 b227 )
    ( on b957 b890 )
    ( on b67 b957 )
    ( on b22 b67 )
    ( clear b22 )
  )
  ( :tasks
    ( Make-35Pile b480 b385 b992 b712 b986 b309 b998 b991 b130 b8 b710 b332 b90 b112 b210 b429 b753 b7 b607 b814 b659 b467 b323 b49 b649 b142 b546 b540 b370 b578 b227 b890 b957 b67 b22 )
  )
)
