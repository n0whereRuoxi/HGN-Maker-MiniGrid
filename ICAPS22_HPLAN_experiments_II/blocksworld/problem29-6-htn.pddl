( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b456 - block
    b171 - block
    b237 - block
    b256 - block
    b666 - block
    b678 - block
    b528 - block
    b76 - block
    b567 - block
    b984 - block
    b460 - block
    b481 - block
    b266 - block
    b296 - block
    b134 - block
    b557 - block
    b829 - block
    b163 - block
    b920 - block
    b839 - block
    b240 - block
    b609 - block
    b322 - block
    b934 - block
    b897 - block
    b861 - block
    b992 - block
    b841 - block
    b480 - block
    b478 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b456 )
    ( on b171 b456 )
    ( on b237 b171 )
    ( on b256 b237 )
    ( on b666 b256 )
    ( on b678 b666 )
    ( on b528 b678 )
    ( on b76 b528 )
    ( on b567 b76 )
    ( on b984 b567 )
    ( on b460 b984 )
    ( on b481 b460 )
    ( on b266 b481 )
    ( on b296 b266 )
    ( on b134 b296 )
    ( on b557 b134 )
    ( on b829 b557 )
    ( on b163 b829 )
    ( on b920 b163 )
    ( on b839 b920 )
    ( on b240 b839 )
    ( on b609 b240 )
    ( on b322 b609 )
    ( on b934 b322 )
    ( on b897 b934 )
    ( on b861 b897 )
    ( on b992 b861 )
    ( on b841 b992 )
    ( on b480 b841 )
    ( on b478 b480 )
    ( clear b478 )
  )
  ( :tasks
    ( Make-29Pile b171 b237 b256 b666 b678 b528 b76 b567 b984 b460 b481 b266 b296 b134 b557 b829 b163 b920 b839 b240 b609 b322 b934 b897 b861 b992 b841 b480 b478 )
  )
)
