require 'xsd/qname'

module Client; module Model


# {http://www.redhat.com/gss/strata}strataEntity
# abstract
class StrataEntity
  def initialize
  end
end

# {http://www.redhat.com/gss/strata}trackedEntity
# abstract
#   createdBy - SOAP::SOAPString
#   createdDate - SOAP::SOAPDateTime
#   lastModifiedBy - SOAP::SOAPString
#   lastModifiedDate - SOAP::SOAPDateTime
class TrackedEntity < StrataEntity
  attr_accessor :createdBy
  attr_accessor :createdDate
  attr_accessor :lastModifiedBy
  attr_accessor :lastModifiedDate

  def initialize(createdBy = nil, createdDate = nil, lastModifiedBy = nil, lastModifiedDate = nil)
    @createdBy = createdBy
    @createdDate = createdDate
    @lastModifiedBy = lastModifiedBy
    @lastModifiedDate = lastModifiedDate
  end
end

# {http://www.redhat.com/gss/strata}base_link
#   value - SOAP::SOAPString
#   xmlattr_title - SOAP::SOAPString
#   xmlattr_rel - SOAP::SOAPString
#   xmlattr_href - SOAP::SOAPString
#   xmlattr_type - SOAP::SOAPString
#   xmlattr_uri - SOAP::SOAPString
class Base_link < StrataEntity
  AttrHref = XSD::QName.new(nil, "href")
  AttrRel = XSD::QName.new(nil, "rel")
  AttrTitle = XSD::QName.new(nil, "title")
  AttrType = XSD::QName.new(nil, "type")
  AttrUri = XSD::QName.new(nil, "uri")

  attr_accessor :value

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_title
    __xmlattr[AttrTitle]
  end

  def xmlattr_title=(value)
    __xmlattr[AttrTitle] = value
  end

  def xmlattr_rel
    __xmlattr[AttrRel]
  end

  def xmlattr_rel=(value)
    __xmlattr[AttrRel] = value
  end

  def xmlattr_href
    __xmlattr[AttrHref]
  end

  def xmlattr_href=(value)
    __xmlattr[AttrHref] = value
  end

  def xmlattr_type
    __xmlattr[AttrType]
  end

  def xmlattr_type=(value)
    __xmlattr[AttrType] = value
  end

  def xmlattr_uri
    __xmlattr[AttrUri]
  end

  def xmlattr_uri=(value)
    __xmlattr[AttrUri] = value
  end

  def initialize(value = nil)
    @value = value
    @__xmlattr = {}
  end
end

# {http://www.redhat.com/gss/strata}problems
#   source - SOAP::SOAPString
#   link - Client::Model::Link
#   problem - Client::Model::Problem
class Problems
  attr_accessor :source
  attr_accessor :link
  attr_accessor :problem

  def initialize(source = [], link = [], problem = [])
    @source = source
    @link = link
    @problem = problem
  end
end

# {http://www.redhat.com/gss/strata}problem
#   source - SOAP::SOAPString
#   link - Client::Model::Link
class Problem
  attr_accessor :source
  attr_accessor :link

  def initialize(source = [], link = [])
    @source = source
    @link = link
  end
end

# {http://www.redhat.com/gss/strata}solutions
class Solutions < ::Array
end

# {http://www.redhat.com/gss/strata}articles
class Articles < ::Array
end

# {http://www.redhat.com/gss/strata}sqiRating
#   createdBy - SOAP::SOAPString
#   createdDate - SOAP::SOAPDateTime
#   lastModifiedBy - SOAP::SOAPString
#   lastModifiedDate - SOAP::SOAPDateTime
#   solution - Client::Model::SqiRating::Solution
#   completeTitle - SOAP::SOAPInteger
#   adheresToContentStandard - SOAP::SOAPInteger
#   accuratelyReflectsProblem - SOAP::SOAPInteger
#   isUnique - SOAP::SOAPInteger
#   clearAndConcise - SOAP::SOAPInteger
#   metadataSetCorrectly - SOAP::SOAPInteger
class SqiRating < TrackedEntity

  # inner class for member: solution
  # {http://www.redhat.com/gss/strata}solution
  #   xmlattr_rel - SOAP::SOAPString
  #   xmlattr_solutionId - SOAP::SOAPString
  class Solution < ::String
    AttrRel = XSD::QName.new(nil, "rel")
    AttrSolutionId = XSD::QName.new(nil, "solutionId")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_rel
      __xmlattr[AttrRel]
    end

    def xmlattr_rel=(value)
      __xmlattr[AttrRel] = value
    end

    def xmlattr_solutionId
      __xmlattr[AttrSolutionId]
    end

    def xmlattr_solutionId=(value)
      __xmlattr[AttrSolutionId] = value
    end

    def initialize(*arg)
      super
      @__xmlattr = {}
    end
  end

  attr_accessor :createdBy
  attr_accessor :createdDate
  attr_accessor :lastModifiedBy
  attr_accessor :lastModifiedDate
  attr_accessor :solution
  attr_accessor :completeTitle
  attr_accessor :adheresToContentStandard
  attr_accessor :accuratelyReflectsProblem
  attr_accessor :isUnique
  attr_accessor :clearAndConcise
  attr_accessor :metadataSetCorrectly

  def initialize(createdBy = nil, createdDate = nil, lastModifiedBy = nil, lastModifiedDate = nil, solution = nil, completeTitle = nil, adheresToContentStandard = nil, accuratelyReflectsProblem = nil, isUnique = nil, clearAndConcise = nil, metadataSetCorrectly = nil)
    @createdBy = createdBy
    @createdDate = createdDate
    @lastModifiedBy = lastModifiedBy
    @lastModifiedDate = lastModifiedDate
    @solution = solution
    @completeTitle = completeTitle
    @adheresToContentStandard = adheresToContentStandard
    @accuratelyReflectsProblem = accuratelyReflectsProblem
    @isUnique = isUnique
    @clearAndConcise = clearAndConcise
    @metadataSetCorrectly = metadataSetCorrectly
  end
end

# {http://www.redhat.com/gss/strata}solution
#   createdBy - SOAP::SOAPString
#   createdDate - SOAP::SOAPDateTime
#   lastModifiedBy - SOAP::SOAPString
#   lastModifiedDate - SOAP::SOAPDateTime
#   id - SOAP::SOAPString
#   uri - SOAP::SOAPAnyURI
#   uidName - SOAP::SOAPString
#   view_uri - SOAP::SOAPAnyURI
#   title - SOAP::SOAPString
#   authorSSOName - SOAP::SOAPString
#   lastModifiedBySSOName - SOAP::SOAPString
#   language - SOAP::SOAPString
#   issue - Client::Model::Solution::Issue
#   environment - Client::Model::Solution::Environment
#   resolution - Client::Model::Solution::Resolution
#   rootCause - Client::Model::Solution::RootCause
#   internalDiagnosticSteps - Client::Model::Solution::InternalDiagnosticSteps
#   externalDiagnosticSteps - SOAP::SOAPString
#   summary - SOAP::SOAPString
#   tags - SOAP::SOAPString
#   m_case - SOAP::SOAPAnyURI
#   tag - Client::Model::Solution::Tag
#   published - SOAP::SOAPBoolean
#   duplicateOf - Client::Model::Solution::DuplicateOf
#   kcsState - SOAP::SOAPString
#   moderationState - SOAP::SOAPString
class Solution < TrackedEntity

  # inner class for member: issue
  # {http://www.redhat.com/gss/strata}issue
  #   text - SOAP::SOAPString
  #   html - SOAP::SOAPString
  class Issue
    attr_accessor :text
    attr_accessor :html

    def initialize(text = nil, html = nil)
      @text = text
      @html = html
    end
  end

  # inner class for member: environment
  # {http://www.redhat.com/gss/strata}environment
  #   text - SOAP::SOAPString
  #   html - SOAP::SOAPString
  class Environment
    attr_accessor :text
    attr_accessor :html

    def initialize(text = nil, html = nil)
      @text = text
      @html = html
    end
  end

  # inner class for member: resolution
  # {http://www.redhat.com/gss/strata}resolution
  #   text - SOAP::SOAPString
  #   html - SOAP::SOAPString
  class Resolution
    attr_accessor :text
    attr_accessor :html

    def initialize(text = nil, html = nil)
      @text = text
      @html = html
    end
  end

  # inner class for member: rootCause
  # {http://www.redhat.com/gss/strata}rootCause
  #   text - SOAP::SOAPString
  #   html - SOAP::SOAPString
  class RootCause
    attr_accessor :text
    attr_accessor :html

    def initialize(text = nil, html = nil)
      @text = text
      @html = html
    end
  end

  # inner class for member: internalDiagnosticSteps
  # {http://www.redhat.com/gss/strata}internalDiagnosticSteps
  #   text - SOAP::SOAPString
  #   html - SOAP::SOAPString
  class InternalDiagnosticSteps
    attr_accessor :text
    attr_accessor :html

    def initialize(text = nil, html = nil)
      @text = text
      @html = html
    end
  end

  # inner class for member: tag
  # {http://www.redhat.com/gss/strata}tag
  #   text - SOAP::SOAPString
  #   html - SOAP::SOAPString
  class Tag
    attr_accessor :text
    attr_accessor :html

    def initialize(text = nil, html = nil)
      @text = text
      @html = html
    end
  end

  # inner class for member: duplicateOf
  # {http://www.redhat.com/gss/strata}duplicateOf
  #   xmlattr_rel - SOAP::SOAPString
  #   xmlattr_solutionId - SOAP::SOAPString
  class DuplicateOf < ::String
    AttrRel = XSD::QName.new(nil, "rel")
    AttrSolutionId = XSD::QName.new(nil, "solutionId")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_rel
      __xmlattr[AttrRel]
    end

    def xmlattr_rel=(value)
      __xmlattr[AttrRel] = value
    end

    def xmlattr_solutionId
      __xmlattr[AttrSolutionId]
    end

    def xmlattr_solutionId=(value)
      __xmlattr[AttrSolutionId] = value
    end

    def initialize(*arg)
      super
      @__xmlattr = {}
    end
  end

  attr_accessor :createdBy
  attr_accessor :createdDate
  attr_accessor :lastModifiedBy
  attr_accessor :lastModifiedDate
  attr_accessor :id
  attr_accessor :uri
  attr_accessor :uidName
  attr_accessor :view_uri
  attr_accessor :title
  attr_accessor :authorSSOName
  attr_accessor :lastModifiedBySSOName
  attr_accessor :language
  attr_accessor :issue
  attr_accessor :environment
  attr_accessor :resolution
  attr_accessor :rootCause
  attr_accessor :internalDiagnosticSteps
  attr_accessor :externalDiagnosticSteps
  attr_accessor :summary
  attr_accessor :tags
  attr_accessor :tag
  attr_accessor :published
  attr_accessor :duplicateOf
  attr_accessor :kcsState
  attr_accessor :moderationState

  def m_case
    @v_case
  end

  def m_case=(value)
    @v_case = value
  end

  def initialize(createdBy = nil, createdDate = nil, lastModifiedBy = nil, lastModifiedDate = nil, id = nil, uri = nil, uidName = nil, view_uri = nil, title = nil, authorSSOName = nil, lastModifiedBySSOName = nil, language = nil, issue = nil, environment = nil, resolution = nil, rootCause = nil, internalDiagnosticSteps = nil, externalDiagnosticSteps = nil, summary = nil, tags = [], v_case = [], tag = [], published = nil, duplicateOf = [], kcsState = nil, moderationState = nil)
    @createdBy = createdBy
    @createdDate = createdDate
    @lastModifiedBy = lastModifiedBy
    @lastModifiedDate = lastModifiedDate
    @id = id
    @uri = uri
    @uidName = uidName
    @view_uri = view_uri
    @title = title
    @authorSSOName = authorSSOName
    @lastModifiedBySSOName = lastModifiedBySSOName
    @language = language
    @issue = issue
    @environment = environment
    @resolution = resolution
    @rootCause = rootCause
    @internalDiagnosticSteps = internalDiagnosticSteps
    @externalDiagnosticSteps = externalDiagnosticSteps
    @summary = summary
    @tags = tags
    @v_case = v_case
    @tag = tag
    @published = published
    @duplicateOf = duplicateOf
    @kcsState = kcsState
    @moderationState = moderationState
  end
end

# {http://www.redhat.com/gss/strata}article
#   createdBy - SOAP::SOAPString
#   createdDate - SOAP::SOAPDateTime
#   lastModifiedBy - SOAP::SOAPString
#   lastModifiedDate - SOAP::SOAPDateTime
#   id - SOAP::SOAPString
#   uri - SOAP::SOAPAnyURI
#   uidName - SOAP::SOAPString
#   view_uri - SOAP::SOAPAnyURI
#   title - SOAP::SOAPString
#   authorSSOName - SOAP::SOAPString
#   lastModifiedBySSOName - SOAP::SOAPString
#   language - SOAP::SOAPString
#   issue - Client::Model::Article::Issue
#   environment - Client::Model::Article::Environment
#   resolution - Client::Model::Article::Resolution
#   rootCause - Client::Model::Article::RootCause
#   internalDiagnosticSteps - Client::Model::Article::InternalDiagnosticSteps
#   externalDiagnosticSteps - SOAP::SOAPString
#   summary - SOAP::SOAPString
#   tags - SOAP::SOAPString
#   m_case - SOAP::SOAPAnyURI
#   tag - Client::Model::Article::Tag
#   published - SOAP::SOAPBoolean
#   duplicateOf - Client::Model::Article::DuplicateOf
#   kcsState - SOAP::SOAPString
#   body - SOAP::SOAPString
class Article < TrackedEntity

  # inner class for member: issue
  # {http://www.redhat.com/gss/strata}issue
  #   text - SOAP::SOAPString
  #   html - SOAP::SOAPString
  class Issue
    attr_accessor :text
    attr_accessor :html

    def initialize(text = nil, html = nil)
      @text = text
      @html = html
    end
  end

  # inner class for member: environment
  # {http://www.redhat.com/gss/strata}environment
  #   text - SOAP::SOAPString
  #   html - SOAP::SOAPString
  class Environment
    attr_accessor :text
    attr_accessor :html

    def initialize(text = nil, html = nil)
      @text = text
      @html = html
    end
  end

  # inner class for member: resolution
  # {http://www.redhat.com/gss/strata}resolution
  #   text - SOAP::SOAPString
  #   html - SOAP::SOAPString
  class Resolution
    attr_accessor :text
    attr_accessor :html

    def initialize(text = nil, html = nil)
      @text = text
      @html = html
    end
  end

  # inner class for member: rootCause
  # {http://www.redhat.com/gss/strata}rootCause
  #   text - SOAP::SOAPString
  #   html - SOAP::SOAPString
  class RootCause
    attr_accessor :text
    attr_accessor :html

    def initialize(text = nil, html = nil)
      @text = text
      @html = html
    end
  end

  # inner class for member: internalDiagnosticSteps
  # {http://www.redhat.com/gss/strata}internalDiagnosticSteps
  #   text - SOAP::SOAPString
  #   html - SOAP::SOAPString
  class InternalDiagnosticSteps
    attr_accessor :text
    attr_accessor :html

    def initialize(text = nil, html = nil)
      @text = text
      @html = html
    end
  end

  # inner class for member: tag
  # {http://www.redhat.com/gss/strata}tag
  #   text - SOAP::SOAPString
  #   html - SOAP::SOAPString
  class Tag
    attr_accessor :text
    attr_accessor :html

    def initialize(text = nil, html = nil)
      @text = text
      @html = html
    end
  end

  # inner class for member: duplicateOf
  # {http://www.redhat.com/gss/strata}duplicateOf
  #   xmlattr_rel - SOAP::SOAPString
  #   xmlattr_solutionId - SOAP::SOAPString
  class DuplicateOf < ::String
    AttrRel = XSD::QName.new(nil, "rel")
    AttrSolutionId = XSD::QName.new(nil, "solutionId")

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_rel
      __xmlattr[AttrRel]
    end

    def xmlattr_rel=(value)
      __xmlattr[AttrRel] = value
    end

    def xmlattr_solutionId
      __xmlattr[AttrSolutionId]
    end

    def xmlattr_solutionId=(value)
      __xmlattr[AttrSolutionId] = value
    end

    def initialize(*arg)
      super
      @__xmlattr = {}
    end
  end

  attr_accessor :createdBy
  attr_accessor :createdDate
  attr_accessor :lastModifiedBy
  attr_accessor :lastModifiedDate
  attr_accessor :id
  attr_accessor :uri
  attr_accessor :uidName
  attr_accessor :view_uri
  attr_accessor :title
  attr_accessor :authorSSOName
  attr_accessor :lastModifiedBySSOName
  attr_accessor :language
  attr_accessor :issue
  attr_accessor :environment
  attr_accessor :resolution
  attr_accessor :rootCause
  attr_accessor :internalDiagnosticSteps
  attr_accessor :externalDiagnosticSteps
  attr_accessor :summary
  attr_accessor :tags
  attr_accessor :tag
  attr_accessor :published
  attr_accessor :duplicateOf
  attr_accessor :kcsState
  attr_accessor :body

  def m_case
    @v_case
  end

  def m_case=(value)
    @v_case = value
  end

  def initialize(createdBy = nil, createdDate = nil, lastModifiedBy = nil, lastModifiedDate = nil, id = nil, uri = nil, uidName = nil, view_uri = nil, title = nil, authorSSOName = nil, lastModifiedBySSOName = nil, language = nil, issue = nil, environment = nil, resolution = nil, rootCause = nil, internalDiagnosticSteps = nil, externalDiagnosticSteps = nil, summary = nil, tags = [], v_case = [], tag = [], published = nil, duplicateOf = [], kcsState = nil, body = nil)
    @createdBy = createdBy
    @createdDate = createdDate
    @lastModifiedBy = lastModifiedBy
    @lastModifiedDate = lastModifiedDate
    @id = id
    @uri = uri
    @uidName = uidName
    @view_uri = view_uri
    @title = title
    @authorSSOName = authorSSOName
    @lastModifiedBySSOName = lastModifiedBySSOName
    @language = language
    @issue = issue
    @environment = environment
    @resolution = resolution
    @rootCause = rootCause
    @internalDiagnosticSteps = internalDiagnosticSteps
    @externalDiagnosticSteps = externalDiagnosticSteps
    @summary = summary
    @tags = tags
    @v_case = v_case
    @tag = tag
    @published = published
    @duplicateOf = duplicateOf
    @kcsState = kcsState
    @body = body
  end
end

# {http://www.redhat.com/gss/strata}link
#   value - SOAP::SOAPString
#   xmlattr_title - SOAP::SOAPString
#   xmlattr_rel - SOAP::SOAPString
#   xmlattr_href - SOAP::SOAPString
#   xmlattr_type - SOAP::SOAPString
#   xmlattr_uri - SOAP::SOAPString
#   xmlattr_ssoUsername - SOAP::SOAPString
class Link < Base_link
  AttrHref = XSD::QName.new(nil, "href")
  AttrRel = XSD::QName.new(nil, "rel")
  AttrSsoUsername = XSD::QName.new(nil, "ssoUsername")
  AttrTitle = XSD::QName.new(nil, "title")
  AttrType = XSD::QName.new(nil, "type")
  AttrUri = XSD::QName.new(nil, "uri")

  attr_accessor :value

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_title
    __xmlattr[AttrTitle]
  end

  def xmlattr_title=(value)
    __xmlattr[AttrTitle] = value
  end

  def xmlattr_rel
    __xmlattr[AttrRel]
  end

  def xmlattr_rel=(value)
    __xmlattr[AttrRel] = value
  end

  def xmlattr_href
    __xmlattr[AttrHref]
  end

  def xmlattr_href=(value)
    __xmlattr[AttrHref] = value
  end

  def xmlattr_type
    __xmlattr[AttrType]
  end

  def xmlattr_type=(value)
    __xmlattr[AttrType] = value
  end

  def xmlattr_uri
    __xmlattr[AttrUri]
  end

  def xmlattr_uri=(value)
    __xmlattr[AttrUri] = value
  end

  def xmlattr_ssoUsername
    __xmlattr[AttrSsoUsername]
  end

  def xmlattr_ssoUsername=(value)
    __xmlattr[AttrSsoUsername] = value
  end

  def initialize(value = nil)
    @value = value
    @__xmlattr = {}
  end
end

# {http://www.redhat.com/gss/strata}source
#   xmlattr_name - SOAP::SOAPString
class Source < ::String
  AttrName = XSD::QName.new(nil, "name")

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_name
    __xmlattr[AttrName]
  end

  def xmlattr_name=(value)
    __xmlattr[AttrName] = value
  end

  def initialize(*arg)
    super
    @__xmlattr = {}
  end
end

# {http://www.redhat.com/gss/strata}attachments
#   attachment - Client::Model::Attachment
class Attachments < StrataEntity
  attr_accessor :attachment

  def initialize(attachment = [])
    @attachment = attachment
  end
end

# {http://www.redhat.com/gss/strata}attachment
#   createdBy - SOAP::SOAPString
#   createdDate - SOAP::SOAPDateTime
#   lastModifiedBy - SOAP::SOAPString
#   lastModifiedDate - SOAP::SOAPDateTime
#   caseId - SOAP::SOAPString
#   uuid - SOAP::SOAPString
#   etag - SOAP::SOAPString
#   uri - SOAP::SOAPAnyURI
#   fileDate - SOAP::SOAPDateTime
#   fileName - SOAP::SOAPString
#   description - SOAP::SOAPString
#   mimeType - SOAP::SOAPString
#   length - SOAP::SOAPLong
#   active - SOAP::SOAPBoolean
#   deprecated - SOAP::SOAPBoolean
#   private - SOAP::SOAPBoolean
#   xmlattr_caseNumber - SOAP::SOAPString
class Attachment < TrackedEntity
  AttrCaseNumber = XSD::QName.new(nil, "caseNumber")

  attr_accessor :createdBy
  attr_accessor :createdDate
  attr_accessor :lastModifiedBy
  attr_accessor :lastModifiedDate
  attr_accessor :caseId
  attr_accessor :uuid
  attr_accessor :etag
  attr_accessor :uri
  attr_accessor :fileDate
  attr_accessor :fileName
  attr_accessor :description
  attr_accessor :mimeType
  attr_accessor :length
  attr_accessor :active
  attr_accessor :deprecated
  attr_accessor :private

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_caseNumber
    __xmlattr[AttrCaseNumber]
  end

  def xmlattr_caseNumber=(value)
    __xmlattr[AttrCaseNumber] = value
  end

  def initialize(createdBy = nil, createdDate = nil, lastModifiedBy = nil, lastModifiedDate = nil, caseId = nil, uuid = nil, etag = nil, uri = nil, fileDate = nil, fileName = nil, description = nil, mimeType = nil, length = nil, active = nil, deprecated = nil, private = nil)
    @createdBy = createdBy
    @createdDate = createdDate
    @lastModifiedBy = lastModifiedBy
    @lastModifiedDate = lastModifiedDate
    @caseId = caseId
    @uuid = uuid
    @etag = etag
    @uri = uri
    @fileDate = fileDate
    @fileName = fileName
    @description = description
    @mimeType = mimeType
    @length = length
    @active = active
    @deprecated = deprecated
    @private = private
    @__xmlattr = {}
  end
end

# {http://www.redhat.com/gss/strata}suggestions
#   suggestion - Client::Model::Suggestion
class Suggestions < StrataEntity
  attr_accessor :suggestion

  def initialize(suggestion = [])
    @suggestion = suggestion
  end
end

# {http://www.redhat.com/gss/strata}suggestion
#   createdBy - SOAP::SOAPString
#   createdDate - SOAP::SOAPDateTime
#   lastModifiedBy - SOAP::SOAPString
#   lastModifiedDate - SOAP::SOAPDateTime
#   algorithmScore - SOAP::SOAPInt
#   analysisAlgorithm - SOAP::SOAPString
#   analysisAlgorithmVersion - SOAP::SOAPString
#   analysisCategory - SOAP::SOAPString
#   analysisModule - SOAP::SOAPString
#   analysisService - SOAP::SOAPString
#   analysisServiceVersion - SOAP::SOAPString
#   bucket - SOAP::SOAPString
#   caseNumber - SOAP::SOAPString
#   client - SOAP::SOAPString
#   clientVersion - SOAP::SOAPString
#   display - SOAP::SOAPBoolean
#   keywords - SOAP::SOAPString
#   location - SOAP::SOAPString
#   luceneScore - SOAP::SOAPInt
#   note - SOAP::SOAPString
#   relevanceScore - SOAP::SOAPInt
#   resource - SOAP::SOAPString
#   rule - SOAP::SOAPString
#   ruleVersion - SOAP::SOAPString
#   scoringAlgorithmVersion - SOAP::SOAPInt
#   solutionId - SOAP::SOAPString
#   solutionKcsState - SOAP::SOAPString
#   solutionOwnerSSOName - SOAP::SOAPString
#   solutionTitle - SOAP::SOAPString
#   solutionUrl - SOAP::SOAPString
#   tracebackUrl - SOAP::SOAPString
class Suggestion < TrackedEntity
  attr_accessor :createdBy
  attr_accessor :createdDate
  attr_accessor :lastModifiedBy
  attr_accessor :lastModifiedDate
  attr_accessor :algorithmScore
  attr_accessor :analysisAlgorithm
  attr_accessor :analysisAlgorithmVersion
  attr_accessor :analysisCategory
  attr_accessor :analysisModule
  attr_accessor :analysisService
  attr_accessor :analysisServiceVersion
  attr_accessor :bucket
  attr_accessor :caseNumber
  attr_accessor :client
  attr_accessor :clientVersion
  attr_accessor :display
  attr_accessor :keywords
  attr_accessor :location
  attr_accessor :luceneScore
  attr_accessor :note
  attr_accessor :relevanceScore
  attr_accessor :resource
  attr_accessor :rule
  attr_accessor :ruleVersion
  attr_accessor :scoringAlgorithmVersion
  attr_accessor :solutionId
  attr_accessor :solutionKcsState
  attr_accessor :solutionOwnerSSOName
  attr_accessor :solutionTitle
  attr_accessor :solutionUrl
  attr_accessor :tracebackUrl

  def initialize(createdBy = nil, createdDate = nil, lastModifiedBy = nil, lastModifiedDate = nil, algorithmScore = nil, analysisAlgorithm = nil, analysisAlgorithmVersion = nil, analysisCategory = nil, analysisModule = nil, analysisService = nil, analysisServiceVersion = nil, bucket = nil, caseNumber = nil, client = nil, clientVersion = nil, display = nil, keywords = nil, location = nil, luceneScore = nil, note = nil, relevanceScore = nil, resource = nil, rule = nil, ruleVersion = nil, scoringAlgorithmVersion = nil, solutionId = nil, solutionKcsState = nil, solutionOwnerSSOName = nil, solutionTitle = nil, solutionUrl = nil, tracebackUrl = nil)
    @createdBy = createdBy
    @createdDate = createdDate
    @lastModifiedBy = lastModifiedBy
    @lastModifiedDate = lastModifiedDate
    @algorithmScore = algorithmScore
    @analysisAlgorithm = analysisAlgorithm
    @analysisAlgorithmVersion = analysisAlgorithmVersion
    @analysisCategory = analysisCategory
    @analysisModule = analysisModule
    @analysisService = analysisService
    @analysisServiceVersion = analysisServiceVersion
    @bucket = bucket
    @caseNumber = caseNumber
    @client = client
    @clientVersion = clientVersion
    @display = display
    @keywords = keywords
    @location = location
    @luceneScore = luceneScore
    @note = note
    @relevanceScore = relevanceScore
    @resource = resource
    @rule = rule
    @ruleVersion = ruleVersion
    @scoringAlgorithmVersion = scoringAlgorithmVersion
    @solutionId = solutionId
    @solutionKcsState = solutionKcsState
    @solutionOwnerSSOName = solutionOwnerSSOName
    @solutionTitle = solutionTitle
    @solutionUrl = solutionUrl
    @tracebackUrl = tracebackUrl
  end
end

# {http://www.redhat.com/gss/strata}groups
#   group - Client::Model::Group
class Groups < StrataEntity
  attr_accessor :group

  def initialize(group = [])
    @group = group
  end
end

# {http://www.redhat.com/gss/strata}group
#   number - SOAP::SOAPString
#   name - SOAP::SOAPString
#   uri - SOAP::SOAPAnyURI
#   isPrivate - SOAP::SOAPBoolean
class Group < StrataEntity
  attr_accessor :number
  attr_accessor :name
  attr_accessor :uri
  attr_accessor :isPrivate

  def initialize(number = nil, name = nil, uri = nil, isPrivate = nil)
    @number = number
    @name = name
    @uri = uri
    @isPrivate = isPrivate
  end
end

# {http://www.redhat.com/gss/strata}account
#   hasGroupACLs - SOAP::SOAPBoolean
#   xmlattr_number - SOAP::SOAPString
class Account < StrataEntity
  AttrNumber = XSD::QName.new(nil, "number")

  attr_accessor :hasGroupACLs

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_number
    __xmlattr[AttrNumber]
  end

  def xmlattr_number=(value)
    __xmlattr[AttrNumber] = value
  end

  def initialize(hasGroupACLs = nil)
    @hasGroupACLs = hasGroupACLs
    @__xmlattr = {}
  end
end

# {http://www.redhat.com/gss/strata}users
#   user - Client::Model::User
class Users < StrataEntity
  attr_accessor :user

  def initialize(user = [])
    @user = user
  end
end

# {http://www.redhat.com/gss/strata}user
#   id - SOAP::SOAPString
#   firstName - SOAP::SOAPString
#   lastName - SOAP::SOAPString
#   email - SOAP::SOAPString
#   accountId - SOAP::SOAPAnyURI
#   preferredLanguage - SOAP::SOAPString
#   title - SOAP::SOAPString
#   timezone - SOAP::SOAPString
#   orgAdmin - SOAP::SOAPBoolean
#   tamContact - SOAP::SOAPBoolean
#   access - SOAP::SOAPBoolean
#   hasChat - SOAP::SOAPBoolean
#   sessionId - SOAP::SOAPString
#   xmlattr_ssoUsername - SOAP::SOAPString
#   xmlattr_uri - SOAP::SOAPAnyURI
class User < StrataEntity
  AttrSsoUsername = XSD::QName.new(nil, "ssoUsername")
  AttrUri = XSD::QName.new(nil, "uri")

  attr_accessor :id
  attr_accessor :firstName
  attr_accessor :lastName
  attr_accessor :email
  attr_accessor :accountId
  attr_accessor :preferredLanguage
  attr_accessor :title
  attr_accessor :timezone
  attr_accessor :orgAdmin
  attr_accessor :tamContact
  attr_accessor :access
  attr_accessor :hasChat
  attr_accessor :sessionId

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_ssoUsername
    __xmlattr[AttrSsoUsername]
  end

  def xmlattr_ssoUsername=(value)
    __xmlattr[AttrSsoUsername] = value
  end

  def xmlattr_uri
    __xmlattr[AttrUri]
  end

  def xmlattr_uri=(value)
    __xmlattr[AttrUri] = value
  end

  def initialize(id = nil, firstName = nil, lastName = nil, email = nil, accountId = nil, preferredLanguage = nil, title = nil, timezone = nil, orgAdmin = nil, tamContact = nil, access = nil, hasChat = nil, sessionId = nil)
    @id = id
    @firstName = firstName
    @lastName = lastName
    @email = email
    @accountId = accountId
    @preferredLanguage = preferredLanguage
    @title = title
    @timezone = timezone
    @orgAdmin = orgAdmin
    @tamContact = tamContact
    @access = access
    @hasChat = hasChat
    @sessionId = sessionId
    @__xmlattr = {}
  end
end

# {http://www.redhat.com/gss/strata}cases
#   m_case - Client::Model::Case
class Cases < StrataEntity
  def m_case
    @v_case
  end

  def m_case=(value)
    @v_case = value
  end

  def initialize(v_case = [])
    @v_case = v_case
  end
end

# {http://www.redhat.com/gss/strata}case
#   createdBy - SOAP::SOAPString
#   createdDate - SOAP::SOAPDateTime
#   lastModifiedBy - SOAP::SOAPString
#   lastModifiedDate - SOAP::SOAPDateTime
#   id - SOAP::SOAPString
#   uri - SOAP::SOAPAnyURI
#   summary - SOAP::SOAPString
#   description - SOAP::SOAPString
#   status - SOAP::SOAPString
#   product - SOAP::SOAPString
#   component - SOAP::SOAPString
#   version - SOAP::SOAPString
#   type - SOAP::SOAPString
#   accountNumber - SOAP::SOAPString
#   reference - SOAP::SOAPString
#   notes - SOAP::SOAPString
#   escalated - SOAP::SOAPBoolean
#   contactName - SOAP::SOAPString
#   contactSsoUsername - SOAP::SOAPString
#   origin - SOAP::SOAPString
#   owner - SOAP::SOAPString
#   internalPriority - SOAP::SOAPString
#   internalStatus - SOAP::SOAPString
#   suppliedName - SOAP::SOAPString
#   suppliedPhone - SOAP::SOAPString
#   suppliedEmail - SOAP::SOAPString
#   severity - SOAP::SOAPString
#   folderNumber - SOAP::SOAPString
#   comments - Client::Model::Comments
#   notified_users - Client::Model::Notified_users
#   entitlement - Client::Model::Entitlement
#   solutions - Client::Model::Solutions
#   xmlattr_caseNumber - SOAP::SOAPString
#   xmlattr_closed - SOAP::SOAPBoolean
#   xmlattr_alternateId - SOAP::SOAPString
class Case < TrackedEntity
  AttrAlternateId = XSD::QName.new(nil, "alternateId")
  AttrCaseNumber = XSD::QName.new(nil, "caseNumber")
  AttrClosed = XSD::QName.new(nil, "closed")

  attr_accessor :createdBy
  attr_accessor :createdDate
  attr_accessor :lastModifiedBy
  attr_accessor :lastModifiedDate
  attr_accessor :id
  attr_accessor :uri
  attr_accessor :summary
  attr_accessor :description
  attr_accessor :status
  attr_accessor :product
  attr_accessor :component
  attr_accessor :version
  attr_accessor :type
  attr_accessor :accountNumber
  attr_accessor :reference
  attr_accessor :notes
  attr_accessor :escalated
  attr_accessor :contactName
  attr_accessor :contactSsoUsername
  attr_accessor :origin
  attr_accessor :owner
  attr_accessor :internalPriority
  attr_accessor :internalStatus
  attr_accessor :suppliedName
  attr_accessor :suppliedPhone
  attr_accessor :suppliedEmail
  attr_accessor :severity
  attr_accessor :folderNumber
  attr_accessor :comments
  attr_accessor :notified_users
  attr_accessor :entitlement
  attr_accessor :solutions

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_caseNumber
    __xmlattr[AttrCaseNumber]
  end

  def xmlattr_caseNumber=(value)
    __xmlattr[AttrCaseNumber] = value
  end

  def xmlattr_closed
    __xmlattr[AttrClosed]
  end

  def xmlattr_closed=(value)
    __xmlattr[AttrClosed] = value
  end

  def xmlattr_alternateId
    __xmlattr[AttrAlternateId]
  end

  def xmlattr_alternateId=(value)
    __xmlattr[AttrAlternateId] = value
  end

  def initialize(createdBy = nil, createdDate = nil, lastModifiedBy = nil, lastModifiedDate = nil, id = nil, uri = nil, summary = nil, description = nil, status = nil, product = nil, component = nil, version = nil, type = nil, accountNumber = nil, reference = nil, notes = nil, escalated = nil, contactName = nil, contactSsoUsername = nil, origin = nil, owner = nil, internalPriority = nil, internalStatus = nil, suppliedName = nil, suppliedPhone = nil, suppliedEmail = nil, severity = nil, folderNumber = nil, comments = nil, notified_users = nil, entitlement = nil, solutions = nil)
    @createdBy = createdBy
    @createdDate = createdDate
    @lastModifiedBy = lastModifiedBy
    @lastModifiedDate = lastModifiedDate
    @id = id
    @uri = uri
    @summary = summary
    @description = description
    @status = status
    @product = product
    @component = component
    @version = version
    @type = type
    @accountNumber = accountNumber
    @reference = reference
    @notes = notes
    @escalated = escalated
    @contactName = contactName
    @contactSsoUsername = contactSsoUsername
    @origin = origin
    @owner = owner
    @internalPriority = internalPriority
    @internalStatus = internalStatus
    @suppliedName = suppliedName
    @suppliedPhone = suppliedPhone
    @suppliedEmail = suppliedEmail
    @severity = severity
    @folderNumber = folderNumber
    @comments = comments
    @notified_users = notified_users
    @entitlement = entitlement
    @solutions = solutions
    @__xmlattr = {}
  end
end

# {http://www.redhat.com/gss/strata}comments
#   comment - Client::Model::Comment
class Comments < StrataEntity
  attr_accessor :comment

  def initialize(comment = [])
    @comment = comment
  end
end

# {http://www.redhat.com/gss/strata}comment
#   createdBy - SOAP::SOAPString
#   createdDate - SOAP::SOAPDateTime
#   lastModifiedBy - SOAP::SOAPString
#   lastModifiedDate - SOAP::SOAPDateTime
#   text - SOAP::SOAPString
#   uri - SOAP::SOAPAnyURI
#   public - SOAP::SOAPBoolean
#   draft - SOAP::SOAPBoolean
#   publishedDate - SOAP::SOAPDateTime
#   xmlattr_id - SOAP::SOAPString
#   xmlattr_caseNumber - SOAP::SOAPString
class Comment < TrackedEntity
  AttrCaseNumber = XSD::QName.new(nil, "caseNumber")
  AttrId = XSD::QName.new(nil, "id")

  attr_accessor :createdBy
  attr_accessor :createdDate
  attr_accessor :lastModifiedBy
  attr_accessor :lastModifiedDate
  attr_accessor :text
  attr_accessor :uri
  attr_accessor :public
  attr_accessor :draft
  attr_accessor :publishedDate

  def __xmlattr
    @__xmlattr ||= {}
  end

  def xmlattr_id
    __xmlattr[AttrId]
  end

  def xmlattr_id=(value)
    __xmlattr[AttrId] = value
  end

  def xmlattr_caseNumber
    __xmlattr[AttrCaseNumber]
  end

  def xmlattr_caseNumber=(value)
    __xmlattr[AttrCaseNumber] = value
  end

  def initialize(createdBy = nil, createdDate = nil, lastModifiedBy = nil, lastModifiedDate = nil, text = nil, uri = nil, public = nil, draft = nil, publishedDate = nil)
    @createdBy = createdBy
    @createdDate = createdDate
    @lastModifiedBy = lastModifiedBy
    @lastModifiedDate = lastModifiedDate
    @text = text
    @uri = uri
    @public = public
    @draft = draft
    @publishedDate = publishedDate
    @__xmlattr = {}
  end
end

# {http://www.redhat.com/gss/strata}notified_users
#   link - Client::Model::Link
class Notified_users < StrataEntity
  attr_accessor :link

  def initialize(link = [])
    @link = link
  end
end

# {http://www.redhat.com/gss/strata}products
class Products < ::Array
end

# {http://www.redhat.com/gss/strata}product
#   code - SOAP::SOAPString
#   name - SOAP::SOAPString
class Product
  attr_accessor :code
  attr_accessor :name

  def initialize(code = nil, name = nil)
    @code = code
    @name = name
  end
end

# {http://www.redhat.com/gss/strata}versions
class Versions < ::Array
end

# {http://www.redhat.com/gss/strata}values
class Values < ::Array

  # {http://www.redhat.com/gss/strata}value
  #   name - SOAP::SOAPString
  #   value - SOAP::SOAPString
  #   xmlattr_type - SOAP::SOAPString
  class Value
    AttrType = XSD::QName.new(nil, "type")

    attr_accessor :name
    attr_accessor :value

    def __xmlattr
      @__xmlattr ||= {}
    end

    def xmlattr_type
      __xmlattr[AttrType]
    end

    def xmlattr_type=(value)
      __xmlattr[AttrType] = value
    end

    def initialize(name = nil, value = nil)
      @name = name
      @value = value
      @__xmlattr = {}
    end
  end
end

# {http://www.redhat.com/gss/strata}entitlements
#   entitlement - Client::Model::Entitlement
class Entitlements < StrataEntity
  attr_accessor :entitlement

  def initialize(entitlement = [])
    @entitlement = entitlement
  end
end

# {http://www.redhat.com/gss/strata}entitlement
#   createdBy - SOAP::SOAPString
#   createdDate - SOAP::SOAPDateTime
#   lastModifiedBy - SOAP::SOAPString
#   lastModifiedDate - SOAP::SOAPDateTime
#   id - SOAP::SOAPString
#   uri - SOAP::SOAPAnyURI
#   name - SOAP::SOAPString
#   sla - SOAP::SOAPString
#   supportLevel - SOAP::SOAPString
#   serviceLevel - SOAP::SOAPString
#   startDate - SOAP::SOAPDate
#   endDate - SOAP::SOAPDate
class Entitlement < TrackedEntity
  attr_accessor :createdBy
  attr_accessor :createdDate
  attr_accessor :lastModifiedBy
  attr_accessor :lastModifiedDate
  attr_accessor :id
  attr_accessor :uri
  attr_accessor :name
  attr_accessor :sla
  attr_accessor :supportLevel
  attr_accessor :serviceLevel
  attr_accessor :startDate
  attr_accessor :endDate

  def initialize(createdBy = nil, createdDate = nil, lastModifiedBy = nil, lastModifiedDate = nil, id = nil, uri = nil, name = nil, sla = nil, supportLevel = nil, serviceLevel = nil, startDate = nil, endDate = nil)
    @createdBy = createdBy
    @createdDate = createdDate
    @lastModifiedBy = lastModifiedBy
    @lastModifiedDate = lastModifiedDate
    @id = id
    @uri = uri
    @name = name
    @sla = sla
    @supportLevel = supportLevel
    @serviceLevel = serviceLevel
    @startDate = startDate
    @endDate = endDate
  end
end

# {http://www.redhat.com/gss/strata}error
#   code - SOAP::SOAPString
#   message - SOAP::SOAPString
class Error
  attr_accessor :code
  attr_accessor :message

  def initialize(code = nil, message = nil)
    @code = code
    @message = message
  end
end

# {http://www.redhat.com/gss/strata}systemProfiles
#   systemProfile - Client::Model::SystemProfile
class SystemProfiles < StrataEntity
  attr_accessor :systemProfile

  def initialize(systemProfile = [])
    @systemProfile = systemProfile
  end
end

# {http://www.redhat.com/gss/strata}systemProfile
#   createdBy - SOAP::SOAPString
#   createdDate - SOAP::SOAPDateTime
#   lastModifiedBy - SOAP::SOAPString
#   lastModifiedDate - SOAP::SOAPDateTime
#   accountNumber - SOAP::SOAPString
#   caseNumber - SOAP::SOAPString
#   attachmentHash - SOAP::SOAPString
#   deprecated - SOAP::SOAPBoolean
#   hash - SOAP::SOAPString
#   systemProfileCategory - Client::Model::SystemProfileCategory
class SystemProfile < TrackedEntity
  attr_accessor :createdBy
  attr_accessor :createdDate
  attr_accessor :lastModifiedBy
  attr_accessor :lastModifiedDate
  attr_accessor :accountNumber
  attr_accessor :caseNumber
  attr_accessor :attachmentHash
  attr_accessor :deprecated
  attr_accessor :hash
  attr_accessor :systemProfileCategory

  def initialize(createdBy = nil, createdDate = nil, lastModifiedBy = nil, lastModifiedDate = nil, accountNumber = nil, caseNumber = nil, attachmentHash = nil, deprecated = nil, hash = nil, systemProfileCategory = [])
    @createdBy = createdBy
    @createdDate = createdDate
    @lastModifiedBy = lastModifiedBy
    @lastModifiedDate = lastModifiedDate
    @accountNumber = accountNumber
    @caseNumber = caseNumber
    @attachmentHash = attachmentHash
    @deprecated = deprecated
    @hash = hash
    @systemProfileCategory = systemProfileCategory
  end
end

# {http://www.redhat.com/gss/strata}SystemProfileCategory
#   systemProfileCategoryName - SOAP::SOAPString
#   systemProfileCategoryDetails - Client::Model::SystemProfileCategoryDetails
class SystemProfileCategory
  attr_accessor :systemProfileCategoryName
  attr_accessor :systemProfileCategoryDetails

  def initialize(systemProfileCategoryName = nil, systemProfileCategoryDetails = [])
    @systemProfileCategoryName = systemProfileCategoryName
    @systemProfileCategoryDetails = systemProfileCategoryDetails
  end
end

# {http://www.redhat.com/gss/strata}SystemProfileCategoryDetails
#   key - SOAP::SOAPString
#   value - SOAP::SOAPString
class SystemProfileCategoryDetails
  attr_accessor :key
  attr_accessor :value

  def initialize(key = nil, value = nil)
    @key = key
    @value = value
  end
end


end; end
